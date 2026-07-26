__constant__ int c_posmark[100];

#define INF 10000

// Helper to get value from transposed board
#define GET_TRANSPOSED(pos, idx, num_boards) boards[(pos) * (num_boards) + (idx)]

__device__ int evaluate_board_internal(const signed char board[100], int side_is_red) {
    int red_score = 0;
    int black_score = 0;

    for (int i = 1; i <= 8; ++i) {
        for (int j = 1; j <= 8; ++j) {
            int val = board[i * 10 + j];
            if (val == 1) red_score++;
            else if (val == -1) black_score++;
        }
    }

    int result = 0;
    if (red_score + black_score < 59) {
        result = black_score - red_score;

        for (int i = 1; i <= 8; ++i) {
            for (int j = 1; j <= 8; ++j) {
                result += (int)board[i * 10 + j] * c_posmark[i * 10 + j];
            }
        }

        if (!side_is_red) result = -result;
    } else {
        if (side_is_red) result = black_score - red_score;
        else result = red_score - black_score;
    }
    return result;
}

__device__ bool is_valid_move(const signed char board[100], int r, int c, int color) {
    if (board[r * 10 + c] != 0) return false;
    int opponent = -color;

    for (int dr = -1; dr <= 1; dr++) {
        for (int dc = -1; dc <= 1; dc++) {
            if (dr == 0 && dc == 0) continue;
            int nr = r + dr;
            int nc = c + dc;
            if (nr < 1 || nr > 8 || nc < 1 || nc > 8) continue;
            if (board[nr * 10 + nc] == opponent) {
                for (int d = 2; d < 8; d++) {
                    int fr = r + dr * d;
                    int fc = c + dc * d;
                    if (fr < 1 || fr > 8 || fc < 1 || fc > 8) break;
                    int val = board[fr * 10 + fc];
                    if (val == 0) break;
                    if (val == color) return true;
                }
            }
        }
    }
    return false;
}

__device__ void apply_move(signed char board[100], int r, int c, int color) {
    board[r * 10 + c] = color;
    int opponent = -color;

    for (int dr = -1; dr <= 1; dr++) {
        for (int dc = -1; dc <= 1; dc++) {
            if (dr == 0 && dc == 0) continue;
            int nr = r + dr;
            int nc = c + dc;
            if (nr >= 1 && nr <= 8 && nc >= 1 && nc <= 8 && board[nr * 10 + nc] == opponent) {
                for (int d = 2; d < 8; d++) {
                    int fr = r + dr * d;
                    int fc = c + dc * d;
                    if (fr < 1 || fr > 8 || fc < 1 || fc > 8) break;
                    int val = board[fr * 10 + fc];
                    if (val == 0) break;
                    if (val == color) {
                        for (int k = 1; k < d; k++) {
                            board[(r + dr * k) * 10 + (c + dc * k)] = color;
                        }
                        break;
                    }
                }
            }
        }
    }
}

__device__ int alphabeta(signed char board[100], int depth, int alpha, int beta, int color, int side_is_red) {
    int red_count = 0;
    int black_count = 0;
    for (int i = 0; i < 100; i++) {
        if (board[i] == 1) red_count++;
        else if (board[i] == -1) black_count++;
    }

    if (red_count == 0) return side_is_red ? 2000 : -2000;
    if (black_count == 0) return side_is_red ? -2000 : 2000;

    if (depth <= 0 || (red_count + black_count > 63)) return evaluate_board_internal(board, side_is_red);

    bool has_move = false;
    int best_val = -INF - 1;

    for (int r = 1; r <= 8; r++) {
        for (int c = 1; c <= 8; c++) {
            if (is_valid_move(board, r, c, color)) {
                has_move = true;
                signed char next_board[100];
                for (int i = 0; i < 100; i++) next_board[i] = board[i];
                apply_move(next_board, r, c, color);

                int val = -alphabeta(next_board, depth - 1, -beta, -alpha, -color, !side_is_red);
                if (val > best_val) best_val = val;
                if (val > alpha) alpha = val;
                if (alpha >= beta) return alpha;
            }
        }
    }

    if (!has_move) {
        // Pass
        bool opponent_has_move = false;
        for (int r = 1; r <= 8; r++) {
            for (int c = 1; c <= 8; c++) {
                if (is_valid_move(board, r, c, -color)) {
                    opponent_has_move = true;
                    break;
                }
            }
            if (opponent_has_move) break;
        }

        if (!opponent_has_move) {
            return evaluate_board_internal(board, side_is_red);
        } else {
            // MATCH PASCAL: Do not decrease depth on pass
            return -alphabeta(board, depth, -beta, -alpha, -color, !side_is_red);
        }
    }

    return best_val > -INF ? best_val : alpha;
}

extern "C" __global__
void evaluate_boards(const int* __restrict__ boards, int* __restrict__ results, int num_boards, int side_is_red) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx >= num_boards) return;

    signed char local_board[100];
    for (int i = 0; i < 100; i++) {
        local_board[i] = (signed char)GET_TRANSPOSED(i, idx, num_boards);
    }

    results[idx] = evaluate_board_internal(local_board, side_is_red);
}

extern "C" __global__
void alphabeta_search(const int* __restrict__ boards, int* __restrict__ results, int num_boards, int depth, int side_is_red, int color) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx >= num_boards) return;

    signed char local_board[100];
    for (int i = 0; i < 100; i++) {
        local_board[i] = (signed char)GET_TRANSPOSED(i, idx, num_boards);
    }

    results[idx] = alphabeta(local_board, depth, -INF, INF, color, side_is_red);
}

typedef unsigned long long uint64;

__constant__ int c_posmark[100];

#define INF 10000

// Helper to get value from transposed board
#define GET_TRANSPOSED(pos, idx, num_boards) boards[(pos) * (num_boards) + (idx)]

// Safe shift macros for 8 directions
#define SHIFT_R(x) (((x) << 1) & 0xfefefefefefefefeULL)
#define SHIFT_L(x) (((x) >> 1) & 0x7f7f7f7f7f7f7f7fULL)
#define SHIFT_D(x) ((x) << 8)
#define SHIFT_U(x) ((x) >> 8)
#define SHIFT_DR(x) (((x) << 9) & 0xfefefefefefefefeULL)
#define SHIFT_DL(x) (((x) << 7) & 0x7f7f7f7f7f7f7f7fULL)
#define SHIFT_UR(x) (((x) >> 7) & 0xfefefefefefefefeULL)
#define SHIFT_UL(x) (((x) >> 9) & 0x7f7f7f7f7f7f7f7fULL)

__device__ __forceinline__ int get_piece(int bit, uint64 red, uint64 black) {
    if (red & (1ULL << bit)) return 1;
    if (black & (1ULL << bit)) return -1;
    return 0;
}

__device__ int evaluate_bitboard(uint64 red, uint64 black, int side_is_red) {
    int red_score = __popcll(red);
    int black_score = __popcll(black);
    int total = red_score + black_score;

    int result = 0;
    if (total <= 59) {
        result = black_score - red_score;

        // Corner (1,1) -> bit 0. Neighbors: 8 (2,1), 1 (1,2)
        if (!((red | black) & (1ULL << 0)))
            result += get_piece(8, red, black) * c_posmark[21] + get_piece(1, red, black) * c_posmark[12];
        else
            result += get_piece(0, red, black) * c_posmark[11];

        // Corner (1,8) -> bit 7. Neighbors: 6 (1,7), 15 (2,8)
        if (!((red | black) & (1ULL << 7)))
            result += get_piece(6, red, black) * c_posmark[17] + get_piece(15, red, black) * c_posmark[28];
        else
            result += get_piece(7, red, black) * c_posmark[18];

        // Corner (8,1) -> bit 56. Neighbors: 48 (7,1), 57 (8,2)
        if (!((red | black) & (1ULL << 56)))
            result += get_piece(48, red, black) * c_posmark[71] + get_piece(57, red, black) * c_posmark[82];
        else
            result += get_piece(56, red, black) * c_posmark[81];

        // Corner (8,8) -> bit 63. Neighbors: 62 (8,7), 55 (7,8)
        if (!((red | black) & (1ULL << 63)))
            result += get_piece(62, red, black) * c_posmark[87] + get_piece(55, red, black) * c_posmark[78];
        else
            result += get_piece(63, red, black) * c_posmark[88];

        if (!side_is_red) result = -result;
    } else {
        if (side_is_red) result = black_score - red_score;
        else result = red_score - black_score;
    }
    return result;
}

__device__ __forceinline__ uint64 get_moves(uint64 own, uint64 opp) {
    uint64 moves = 0;
    uint64 t;
    uint64 empty = ~(own | opp);

#define DIR(SHIFT) \
    t = SHIFT(own) & opp; \
    t |= SHIFT(t) & opp; t |= SHIFT(t) & opp; t |= SHIFT(t) & opp; t |= SHIFT(t) & opp; t |= SHIFT(t) & opp; \
    moves |= SHIFT(t) & empty;

    DIR(SHIFT_R) DIR(SHIFT_L) DIR(SHIFT_D) DIR(SHIFT_U)
    DIR(SHIFT_DR) DIR(SHIFT_DL) DIR(SHIFT_UR) DIR(SHIFT_UL)
#undef DIR
    return moves;
}

__device__ __forceinline__ void make_move(uint64& own, uint64& opp, uint64 move) {
    uint64 flipped = 0;
    uint64 t;
    own |= move;

#define DIR(SHIFT) \
    t = SHIFT(move) & opp; \
    t |= SHIFT(t) & opp; t |= SHIFT(t) & opp; t |= SHIFT(t) & opp; t |= SHIFT(t) & opp; t |= SHIFT(t) & opp; \
    if (SHIFT(t) & own) flipped |= t;

    DIR(SHIFT_R) DIR(SHIFT_L) DIR(SHIFT_D) DIR(SHIFT_U)
    DIR(SHIFT_DR) DIR(SHIFT_DL) DIR(SHIFT_UR) DIR(SHIFT_UL)
#undef DIR

    own |= flipped;
    opp &= ~flipped;
}

__device__ int alphabeta_bitboard(uint64 own, uint64 opp, int depth, int alpha, int beta, int side_is_red) {
    int own_count = __popcll(own);
    int opp_count = __popcll(opp);

    if (own_count == 0) return 2000;
    if (opp_count == 0) return -2000;

    if (depth <= 0 || (own_count + opp_count >= 64)) {
        return evaluate_bitboard(side_is_red ? own : opp, side_is_red ? opp : own, side_is_red);
    }

    uint64 moves = get_moves(own, opp);
    if (moves == 0) {
        uint64 opp_moves = get_moves(opp, own);
        if (opp_moves == 0) {
            return evaluate_bitboard(side_is_red ? own : opp, side_is_red ? opp : own, side_is_red);
        } else {
            return -alphabeta_bitboard(opp, own, depth, -beta, -alpha, !side_is_red);
        }
    }

    int best_val = -INF - 1;

    // Priority moves: corners
    uint64 corners = moves & 0x8100000000000081ULL;
    while (corners) {
        int bit = __ffsll(corners) - 1;
        uint64 move = 1ULL << bit;
        corners &= ~move;
        moves &= ~move;

        uint64 next_own = own;
        uint64 next_opp = opp;
        make_move(next_own, next_opp, move);

        int val = -alphabeta_bitboard(next_opp, next_own, depth - 1, -beta, -alpha, !side_is_red);
        if (val > best_val) best_val = val;
        if (val > alpha) alpha = val;
        if (alpha >= beta) return alpha;
    }

    while (moves) {
        int bit = __ffsll(moves) - 1;
        uint64 move = 1ULL << bit;
        moves &= ~move;

        uint64 next_own = own;
        uint64 next_opp = opp;
        make_move(next_own, next_opp, move);

        int val = -alphabeta_bitboard(next_opp, next_own, depth - 1, -beta, -alpha, !side_is_red);
        if (val > best_val) best_val = val;
        if (val > alpha) alpha = val;
        if (alpha >= beta) return alpha;
    }

    return best_val > -INF ? best_val : alpha;
}

extern "C" __global__
void evaluate_boards(const int* __restrict__ boards, int* __restrict__ results, int num_boards, int side_is_red) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx >= num_boards) return;

    uint64 red = 0, black = 0;
    for (int i = 0; i < 64; i++) {
        int r = (i >> 3) + 1;
        int c = (i & 7) + 1;
        int val = GET_TRANSPOSED(r * 10 + c, idx, num_boards);
        if (val == 1) red |= (1ULL << i);
        else if (val == -1) black |= (1ULL << i);
    }

    results[idx] = evaluate_bitboard(red, black, side_is_red);
}

extern "C" __global__
void alphabeta_search(const int* __restrict__ boards, int* __restrict__ results, int num_boards, int depth, int side_is_red, int color) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx >= num_boards) return;

    uint64 own = 0, opp = 0;
    for (int i = 0; i < 64; i++) {
        int r = (i >> 3) + 1;
        int c = (i & 7) + 1;
        int val = GET_TRANSPOSED(r * 10 + c, idx, num_boards);
        if (val == color) own |= (1ULL << i);
        else if (val == -color) opp |= (1ULL << i);
    }

    results[idx] = alphabeta_bitboard(own, opp, depth, -INF, INF, side_is_red);
}

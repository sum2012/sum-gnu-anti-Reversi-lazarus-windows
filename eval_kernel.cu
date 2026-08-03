typedef unsigned long long uint64;

struct Tboard {
    uint64 red;
    uint64 black;
    uint64 hash;
};

__constant__ int c_posmark[100];

#define INF 10000

__device__ __forceinline__ int get_piece_val(int bit, uint64 red, uint64 black) {
    if (red & (1ULL << bit)) return 1;
    if (black & (1ULL << bit)) return -1;
    return 0;
}

__device__ __forceinline__ int evaluate_bitboard(uint64 red, uint64 black, int side_is_red) {
    int red_score = __popcll(red);
    int black_score = __popcll(black);
    int total = red_score + black_score;

    if (total <= 59) {
        int result = black_score - red_score;
        uint64 occupied = red | black;

        // Corner adjacent mapping (Matches Pascal PosMark indices)
        if (!(occupied & (1ULL << 0)))
            result += get_piece_val(8, red, black) * c_posmark[21] + get_piece_val(1, red, black) * c_posmark[12];
        else
            result += get_piece_val(0, red, black) * c_posmark[11];

        if (!(occupied & (1ULL << 7)))
            result += get_piece_val(6, red, black) * c_posmark[17] + get_piece_val(15, red, black) * c_posmark[28];
        else
            result += get_piece_val(7, red, black) * c_posmark[18];

        if (!(occupied & (1ULL << 56)))
            result += get_piece_val(48, red, black) * c_posmark[71] + get_piece_val(57, red, black) * c_posmark[82];
        else
            result += get_piece_val(56, red, black) * c_posmark[81];

        if (!(occupied & (1ULL << 63)))
            result += get_piece_val(62, red, black) * c_posmark[87] + get_piece_val(55, red, black) * c_posmark[78];
        else
            result += get_piece_val(63, red, black) * c_posmark[88];

        return side_is_red ? result : -result;
    } else {
        return side_is_red ? (black_score - red_score) : (red_score - black_score);
    }
}

extern "C" __global__
void evaluate_boards(const Tboard* __restrict__ boards, int* __restrict__ results, int num_boards, int side_is_red) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx >= num_boards) return;

    Tboard b = boards[idx];
    results[idx] = evaluate_bitboard(b.red, b.black, side_is_red);
}

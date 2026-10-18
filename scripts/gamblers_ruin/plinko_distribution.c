// Note: Plinko is no longer planned to be in the app.
//
// Plinko distribution given # of rows and right probability
//
// To compile from repo root:
// clang scripts\gamblers_ruin\plinko_distribution.c
// ./a.exe

#include <stdio.h>

int ROWS = 10;
float RIGHT_PROB = .45;

long long nCr(int n, int r) {
    int large_denom = r > (n - r) ? r : (n - r);
    int small_denom = r < (n - r) ? r : (n - r);

    long long numer_after = 1;
    for (int i = n; i > large_denom; i--) {
        numer_after *= i;
    }

    long long denom_afer = 1;
    for (int i = small_denom; i > 1; i--) {
        denom_afer *= i;
    }

    return numer_after / denom_afer;
}

double exp_fi(float f, int i) {
    if (i == 0) return 1;

    double result = f;

    for (int j = 1; j < i; j++) {
        result *= f;
    }

    return result;
}

int main(void) {
    double total = 0;

    for (int bucket = 0; bucket <= ROWS; bucket++) {
        double result_prob = exp_fi((1.0 - RIGHT_PROB), (ROWS - bucket)) * exp_fi(RIGHT_PROB, bucket);
        double result_weighted = result_prob * nCr(ROWS, bucket);

        printf("%i-%f-%i ", bucket, result_weighted, ROWS - bucket);
        total += result_weighted;
    }

    printf("\nTotal: %f\n", total);
    return 0;
}

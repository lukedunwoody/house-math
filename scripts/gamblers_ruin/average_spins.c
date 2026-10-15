// This script calculates how many times the Gambler’s Ruin
// graph simulation will reach a certain number of spins.
//
// This is so we can determine the best max spin number for the x-axis.
//
// To compile from repo root:
// clang scripts\gamblers_ruin\ceiling_hits.c
// ./a.exe

#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define SIM_AMOUNT 25000

int START_BANKROLL = 10000;
int TAKE_PROFIT = 100;
int BET_SIZE = 1;
float SPIN_PROBABILITY = 18.0/38.0;

int main(void) {
    srand((unsigned int)time(NULL));
    float average;
    float high_half_1_average;
    float high_half_2_average;
    float high_half_3_average;

    int high_half_1_count = 0;
    int high_half_2_count = 0;
    int high_half_3_count = 0;

    int max = 0;

    for (int sim = 1; sim <= SIM_AMOUNT; sim++) {
        int bankroll = START_BANKROLL;
        int spin = 0;
        int upper_limit = (START_BANKROLL + TAKE_PROFIT);

        while (bankroll < upper_limit && bankroll > 0 && spin < 250000) {
            if (((float)rand() / (float)RAND_MAX) < SPIN_PROBABILITY) {
                bankroll += BET_SIZE;
            } else {
                bankroll -= BET_SIZE;
            }
            spin++;
        }

        if (spin > max) max = spin;

        average = ((1.0/sim) * spin) + ((1.0 - (1.0/sim)) * average);

        if (spin > average) {
            high_half_1_count++;
            high_half_1_average = ((1.0/high_half_1_count) * spin) + ((1.0 - (1.0/high_half_1_count)) * high_half_1_average);

            if (spin > high_half_1_average) {
                high_half_2_count++;
                high_half_2_average = ((1.0/high_half_2_count) * spin) + ((1.0 - (1.0/high_half_2_count)) * high_half_2_average);

                if (spin > high_half_2_average) {
                    high_half_3_count++;
                    high_half_3_average = ((1.0/high_half_3_count) * spin) + ((1.0 - (1.0/high_half_3_count)) * high_half_3_average);
                }
            }
        }
    }

    printf("avg: %f\nhh1: %f\nhh2: %f\nhh3: %f\nmax: %i", average, high_half_1_average, high_half_2_average, high_half_3_average, max);

    return 0;
}

// Chance of reaching TP with the Martingale System
//
// To compile from repo root:
// clang scripts\martingale\chance_of_winning.c
// ./a.exe

#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int SIM_AMOUNT = 25000;
int START_BANKROLL = 100;
int TAKE_PROFIT = 100;
int BET_SIZE = 1;
float SPIN_PROBABILITY = 18.0/38.0;

int main(void) {
    srand((unsigned int)time(NULL));

    int wins = 0;

    for (int sim = 0; sim < SIM_AMOUNT; sim++) {
        int bankroll = START_BANKROLL;
        int bet_size = BET_SIZE;
        int spin = 0;
        int upper_limit = (START_BANKROLL + TAKE_PROFIT);

        while (bankroll < upper_limit && bankroll > 0 && spin < 250000) {
            if (((float)rand() / (float)RAND_MAX) < SPIN_PROBABILITY) {
                // Win
                bankroll += bet_size;
                bet_size = BET_SIZE;

                if (bankroll >= upper_limit) {
                    wins++;
                    break;
                }
            } else {
                // Lose
                bankroll -= bet_size;
                bet_size *= 2;

                if (bankroll <= 0) {
                    break;
                }

                if (bet_size > bankroll) {
                    bet_size = bankroll;
                }
            }
            spin++;
        }
    }

    float win_percentage = (wins * 1.0) / SIM_AMOUNT;
    printf("Win Percentage: %f\n", win_percentage);

    return 0;
}

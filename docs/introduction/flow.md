# Introduction Flow

This document outlines the introduction flow, which should take comfortably less than three minutes.

> This represents text shown to users.

v0.1.0

Last change:
First full draft

Notes:
All the core ideas are here. The main concern is whether the flow fits comfortably within the three minute window.

## Screen 1 - Hook

Target time: 35 seconds

**On Screen:**

- $100 balance
- Large, minimal slot machine
- Large spin button for $5 spins

The user spins three times, with one win, one near miss, and one miss in random order.

**After Third Spin**

Change the spin button to Auto Spin. After the user selects it, run one slightly faster spin, then progressively increase the speed over three more full spins until the reels blur.

Then fade in a chart showing the user's bankroll on the y-axis ($0–$200) and the number of spins on the x-axis (0–50). Simulate repeated $5 bets with a 95% RTP, and show the bankroll dropping to zero.

**After bankruptcy, display:**

> You lost all your money in **XXX spins.**
>
> This was a random simulation with odds similar to real slot machines.
> 
> The slot machine didn't take your money with luck, it used math.

Button:
> See how the math works ->

## Screen 2 - Expected Value

Target time: 30 seconds

Question to answer: How does the house edge work?

> Expected value is the average amount you will win or lose per bet over time, calculated by multiplying each result by its probability and adding them together. This means a result with a low probability can outweigh a more likely one if the result is extreme enough.
>
> Picture this as two rectangles: the width (x-axis) represents probability, the height (y-axis) represents the money won or lost, and the area shows how much that outcome changes the average.

**On Screen:**

- Slider to adjust the odds
- EV equation that updates dynamically
- Rectangles that scale with the slider
- Winning rectangle above the center, on the left
- Losing rectangle below the center, on the right
- X-axis represents probability
- Y-axis represents outcome
- |win$| + |lose$| = $100 at 95% RTP
- Switch-view button that keeps the same areas while assigning 50% of the x-axis to each outcome
- Animate the rectangles by interpolating their corresponding corners

**Show the user at the end:**

> Notice how you can win more often than you lose and still lose money over time? That's because the expected value is below $0. That's the house edge.

## Screen 3 - Gambler's Ruin

Target time: 40 seconds

Question to answer: How does the house edge affect real gambling scenarios?

> Suppose you start with $10,000 and repeatedly bet $1 on red in American roulette until you either make $100 in profit or lose everything. What are your chances of reaching that $100 profit?

>- less than 1%
>- 1% to 10%
>- 10% to 40%
>- 40% to 70%
>- more than 70%

> *(No/Yes)*, the answer is 0.002656%, or about 1 in 37,644. Why is it so low?
>
> Over a few bets, a lucky streak can outweigh the edge. But each bet still slightly favors the house. As those small expected losses stack up, they overpower luck's swings, so luck matters less to the average. That’s why reaching your target before going broke is so unlikely.
>
> Don’t believe it? Simulate this exact scenario:

**On Screen:**

- Balance label
- Line chart
- Number of bets (x-axis), up to 250,000
- Bankroll (y-axis), $0–$10,100
- Take-profit line
- Expected-value line
- Legend for line colors

## Screen 4 - Martingale System

Target time: 40 seconds

Question to answer: Can a betting strategy beat the house edge?

> Many people try to beat the house edge with betting strategies.
>
> The Martingale system is one of the best known strategies. You double your bet after every loss, so one win recovers all previous losses plus a unit of profit. It seems unstoppable, but the bets scale quickly, and rare massive bets cancel out frequent small wins.
>
> If you start with $10,000 and a $1 bet, the Martingale system has only an approximately one in five chance of making $10,000 in profit, less than your chance of making $10,000 with a single all-in spin.
> 
> Try simulating this situation yourself:

**On Screen:**

- Balance label
- Line chart
- Number of bets (x-axis), up to 50,000
- Bankroll (y-axis), $0–$20,000
- Take profit line
- Expected value line
- Legend for line colors

## Screen 5 - Thank You & What to do Next

Target time: 10 seconds

>### Thank you for trying House Math!
>
> You've now seen why the house has an edge over time.

> Choose what to explore next:

Button:
>#### Explore the simulations
> 
> Retry with different values and see how each simulation plays out.

Button:
>#### Test your intuition
>
> Play a quick game and see if you can tell which event is more likely.

> *You can revisit this introduction anytime in Settings.*

# App Design Journal

A keynote assignment for Develop the Future that has been transferred here for documentation.

## My app idea

Today, many young people are signing up for gambling apps or going to casinos without understanding the math behind why the house always wins. I want to make an app that makes these concepts easy for anybody to understand through intuitive visualizations and interactions. This will help our users make more educated decisions about if and why they gamble.

The primary goal of my app would be to increase the user’s understanding of some of the most fundamental and unintuitive gambling concepts like expected value, the Martingale Strategy, and Gambler’s Ruin. Someone who used the app would find graphs and interactive simulations to help them understand the math behind these concepts in a way that is neither boring nor difficult. There will also be a mini game like the Higher Lower Game but with the probability of different events so the user can witness the unexpected odds of certain events in a fun and engaging way.

## User actions in my app

1. The user will want to see an interactive expected value simulation to understand why you can still lose money if you win most of your bets.
2. The user will want to see an interactive simulation of the Martingale Strategy to understand why the common strategy of doubling your bet after you lose doesn’t work in the long term.
3. The user will want to see an interactive simulation of the Gambler’s Ruin to understand how the house edge stacks the longer you play an unfair game.
4. The user will want to use the sports betting calculator to see how big the house edge is with different odds.
5. The user will want to play the mini game based on the Higher Lower game for a fun way to understand the rarity of events relative to other familiar events.

## User input and changes to my app's state

| User Input | Changes to the app state |
| --- | --- |
| The user inputs their values and runs a simulation. | Chart shows a line with expected bankroll over time with the line of the actual bankroll of the simulation. |
| The user inputs the odds of a sporting or prediction market event. | The app shows a pie chart with the probabilities and house edge and the no-vig odds. |
| The user selects which event they think is more likely in the mini game. | If they are right, the streak increases and top element is replaced with a new one. If they are wrong, the game resets. |

## My app's features

- **Keyboard:** Allows typing input
- **Touchscreen:** Allows users to interact through tap, swipe, and drag
- **Other:** Swift Charts

## Inclusive design in my app

For the charts, I am planning to make the background flash green or red depending on whether the simulation won or lost. There will be a setting to reduce the intensity of the flashing lights for people with epilepsy. Additionally, all inputs will have alternate methods, like sliders, for easier and quicker selection. Most other elements will be designed with accessibility in mind by using mostly text to communicate messages and actions.

- **Cognitive Support:** Use motion, fonts, colour, and sound carefully to avoid sensory overload and to help people — including those with learning challenges — focus on what’s important.
- **Accessibility Descriptions:** Include alternative text for visual elements and accurately label buttons to provide context for people who are blind, have low vision, or use a screen reader.
- **Accessible Content:** Add captions, transcripts, or sign language support for video or audio elements and haptic alerts for people who have hearing loss or want a silent device.
- **Alternate Input:** Provide multiple ways to complete gesture-based (like swiping) or typing actions that can support someone with limited mobility.

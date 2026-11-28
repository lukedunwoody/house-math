//
//  BalanceDisplay.swift
//  HouseMath
//
//  Created by Luke Dunwoody on 2026-11-20.
//

import SwiftUI

private func formatMoney(amount: Double) -> String {
    let formattedAmount = String(format: "%.2f", abs(amount))
    return "\(amount < 0 ? "-$" : "$")\(formattedAmount)"
}

struct AnimatedBalance: View, Animatable {
    var balance: Double
    var displayedBalance: Double

    private var balanceColor: Color {
        let difference = balance - displayedBalance
        return Color(
            hue: difference > 0 ? 1.0 / 3.0 : 0.0,
            saturation: min(pow(abs(difference / 8), 0.4), 0.6),
            brightness: 1.0
        )
    }

    var animatableData: Double {
        get { displayedBalance }
        set { displayedBalance = newValue }
    }

    var body: some View {
        Text(formatMoney(amount: displayedBalance))
            .contentTransition(.numericText())
            .monospacedDigit()
            .font(.system(size: 24, weight: .bold))
            .foregroundStyle(balanceColor)
    }
}

struct BalanceDisplay: View {
    let demoBalance: Double
    let betSize: Double

    var body: some View {
        @State var displayedBalance = demoBalance
        
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .fill(.glassPassive.opacity(0.3))
                .glassEffect(.clear.tint(.glassPassive), in: RoundedRectangle(cornerRadius: 12))
                .frame(width: 344, height: 72)

            HStack(spacing: 48) {
                VStack {
                    Text("Demo Balance:")
                        .foregroundStyle(.white)

                    AnimatedBalance(balance: demoBalance, displayedBalance: displayedBalance)
                        .animation(.spring(duration: 1.2), value: displayedBalance)
                }

                VStack {
                    Text("Bet Size:")
                        .foregroundStyle(.white)

                    Text(formatMoney(amount: betSize))
                        .monospacedDigit()
                        .font(.system(size: 24, weight: .bold))
                        .foregroundStyle(.white)
                }
            }
        }
    }
}

#Preview {
    ZStack {
        Color.background
            .ignoresSafeArea()

        BalanceDisplay(demoBalance: 100, betSize: 5)
    }
}

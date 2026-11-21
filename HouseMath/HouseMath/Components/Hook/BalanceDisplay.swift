//
//  BalanceDisplay.swift
//  HouseMath
//
//  Created by Luke Dunwoody on 2026-11-20.
//

import SwiftUI

struct BalanceDisplay: View {
    let demoBalance: Double
    let betSize: Double
    
    private func formatMoney(amount: Double) -> String {
        let formattedAmount = String(format: "%.2f", abs(amount))
        return "\(amount < 0 ? "-$" : "$")\(formattedAmount)"
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .fill(.glassPassive.opacity(0.3))
                .glassEffect(.clear.tint(.glassPassive), in: RoundedRectangle(cornerRadius: 12))
                .frame(width: 344, height: 72)
            
            HStack(spacing: 48) {
                VStack {
                    Text("Demo Balance:")
                        .foregroundStyle(.white)

                    Text(formatMoney(amount: demoBalance))
                        .font(.system(size: 24, weight: .bold))
                        .foregroundStyle(.white)
                }
                
                VStack {
                    Text("Bet Size:")
                        .foregroundStyle(.white)
                    
                    Text(formatMoney(amount: betSize))
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

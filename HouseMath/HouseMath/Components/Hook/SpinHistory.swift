//
//  SpinHistory.swift
//  HouseMath
//
//  Created by Luke Dunwoody on 2026-11-20.
//

import SwiftUI

struct SpinHistory: View {
    let amount0: Double
    let amount1: Double
    let amount2: Double
    
    var amounts: [Double] {
        [amount0, amount1, amount2]
    }
    
    private func formatAmount(amount: Double) -> String {
        if amount == 0 {
            return "0.00"
        }
        if amount == -420.69 {
            return "—"
        }
        
        let formattedAmount = String(format: "%.2f", abs(amount))
        return "\(amount < 0 ? "-" : "+")\(formattedAmount)"
    }
    
    private func colorFromAmount(amount: Double) -> Color {
        if amount == -420.69 || amount == 0 {
            return .glassPassive.opacity(0.2)
        } else if amount > 0 {
            return Color(hex: "018800").opacity(0.4)
        } else {
            return Color(hex: "AD0100").opacity(0.4)
        }
    }
    
    var body: some View {
        VStack(spacing: 12) {
            Text("Spin History")
                .foregroundStyle(.text)
                .font(.system(size: 17, weight: .medium))
            
            HStack(spacing: 8) {
                ForEach(amounts.indices, id: \.self) { i in
                    ZStack {
                        RoundedRectangle(cornerRadius: 16)
                            .fill(colorFromAmount(amount: amounts[i]))
                            .glassEffect(.clear.tint(.glassPassive), in: RoundedRectangle(cornerRadius: 16))
                            .frame(width: 62, height: 32)
                        
                        Text(formatAmount(amount: amounts[i]))
                            .foregroundStyle(.white)
                            .font(.system(size: 13))
                    }
                }
            }
        }
    }
}

#Preview {
    ZStack {
        Color.background
            .ignoresSafeArea()

        SpinHistory(amount0: -5, amount1: 5, amount2: -420.69)
    }
}

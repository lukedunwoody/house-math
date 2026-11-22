//
//  HookView.swift
//  HouseMath
//
//  Created by Luke Dunwoody on 2026-11-12.
//

import SwiftUI

struct HookView: View {
    let onContinue: () -> Void
    
    let spinTime: Double
    let spinImageAmount: Int
    
    @State private var stage = 1
    
    @State private var demoBalance: Double = 100

    @State private var spinHistoryAmounts: [Double] = [-420.69, -420.69, -420.69]
    
    @State private var spinning = false
    private let winSpin = Int.random(in: 1...3)
    @State private var spinCount = 0
    @State private var spinRequest = SlotMachine.SpinRequest(
        spinNumber: 0,
        win: false
    )
    
    var body: some View {
        ZStack {
            Color.background
                .ignoresSafeArea()
            
            if stage == 1 {
                VStack {
                    HeaderLogo()
                    
                    Spacer()
                    
                    VStack {
                        Text("Welcome!")
                            .font(.custom("Gelasio", size: 64))
                            .foregroundStyle(.tint)
                        
                        Text("Simulate a spin to see the\ncasino's math in action!")
                            .font(.system(size: 20))
                            .multilineTextAlignment(.center)
                            .foregroundStyle(.text)
                    }
                    
                    Spacer()
                    
                    VStack(spacing: 24) {
                        BalanceDisplay(demoBalance: demoBalance, betSize: 5)
                        
                        SlotMachine(
                            spinTime: spinTime,
                            spinImageAmount: spinImageAmount,
                            spinRequest: $spinRequest
                        )
                    }
                    
                    Spacer()
                    
                    SpinHistory(amounts: spinHistoryAmounts)
                    
                    Spacer()
                    
                    Button {
                        if !spinning && spinCount < 3 {
                            spinning = true
                            spinCount += 1
                            var win = spinCount == winSpin
                            var balanceChange: Double = (win ? 8 : -5)
                            
                            spinRequest = .init(
                                spinNumber: spinCount,
                                win: win
                            )
                            
                            Task {
                                try? await Task.sleep(nanoseconds: UInt64(spinTime * 1_000_000_000))
                                spinHistoryAmounts[spinCount - 1] = balanceChange
                                demoBalance += balanceChange
                                spinning = false
                            }
                        }
                    } label: {
                        Text("Simulate Spin")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundStyle(spinning ? .text : .white)
                            .frame(width: 340, height: 54)
                            .glassEffect(
                                .regular.tint(spinning ? .glassPassive : Color(hex: "11A711").opacity(0.6)).interactive(),
                                in: Capsule()
                            )
                    }
                    .buttonStyle(.plain)
                }
                .padding(.vertical, 24)
            }
            
            if stage == 2 {
                VStack {
                    Text("Hook")
                        .foregroundStyle(.text)
                    
                    ContinueButton(action: onContinue)
                }
            }
        }
    }
}

#Preview {
    HookView(onContinue: {}, spinTime: 4, spinImageAmount: 40)
}

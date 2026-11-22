//
//  HookView.swift
//  HouseMath
//
//  Created by Luke Dunwoody on 2026-11-12.
//

import SwiftUI

struct HookView: View {
    let onContinue: () -> Void
    
    @State private var stage = 1
    
    @State private var demoBalance: Double = 100
    @State private var spinTrigger = 0
    
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
                        
                        SlotMachine(spinTrigger: $spinTrigger)
                    }
                    
                    Spacer()
                    
                    SpinHistory(amount0: -420.69, amount1: -420.69, amount2: -420.69)
                    
                    Spacer()
                    
                    Button {
                        spinTrigger += 1
                    } label: {
                        Text("Simulate Spin")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundStyle(.white)
                            .frame(width: 340, height: 54)
                            .glassEffect(
                                .regular.tint(Color(hex: "11A711").opacity(0.6)).interactive(),
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
    HookView {}
}

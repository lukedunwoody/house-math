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

    @State private var balanceHistory: [Double] = []
    @State private var spinHistoryAmounts: [Double?] = [nil, nil, nil]

    @State private var mainTransitionProgress = 0.0

    @State private var spinning = false
    @State private var autoSpinning = false

    private let winSpin = Int.random(in: 1...3)
    private let winAutoSpin = Int.random(in: 4...6)
    
    @State private var spinCount = 0
    @State private var spinRequest = SlotMachine.SpinRequest(
        spinNumber: 0,
        win: false,
        spinTime: Config.Hook.baseSpinTime,
        spinImageAmount: Config.Hook.baseSpinImageAmount
    )
    
    func spinHistoryAppend(amount: Double) -> Void {
        for i in 0...2 {
            if spinHistoryAmounts[i] == nil {
                spinHistoryAmounts[i] = amount
                return
            }
        }
        
        for i in 0...1 {
            spinHistoryAmounts[i] = spinHistoryAmounts[i + 1]
        }
        
        spinHistoryAmounts[2] = amount
    }
    
    func spin(
        win: Bool,
        spinTime: Double,
        spinImageAmount: Int,
        afterSpinAction: @escaping () -> Void
    ) -> Void {
        guard !spinning else { return }
        
        spinning = true
        spinCount += 1
        
        var balanceChange: Double = (win ? Config.Hook.winAmount : Config.Hook.loseAmount)
        
        spinRequest = .init(
            spinNumber: spinCount,
            win: win,
            spinTime: spinTime,
            spinImageAmount: spinImageAmount
        )
        
        Task {
            try? await Task.sleep(for: .seconds(spinTime))
            
            spinHistoryAppend(amount: balanceChange)
            balanceHistory.append(demoBalance)
            demoBalance += balanceChange
            
            afterSpinAction()
        }
    }
    
    func simulatedSpin() -> Void {
        if !spinning && spinCount < 3 {
            let afterSpinAction: () -> Void = {
                Task {
                    if spinCount == 3 {
                        // TODO: #5 Transition Here
                        
                        try? await Task.sleep(for: .seconds(0.8))
                        spinning = false
                        stage = 2
                    } else {
                        spinning = false
                    }
                }
            }
            
            spin(
                win: spinCount == winSpin,
                spinTime: Config.Hook.baseSpinTime,
                spinImageAmount: Config.Hook.baseSpinImageAmount,
                afterSpinAction: afterSpinAction
            )
        }
    }
    
    func autoSpin() -> Void {
        if !autoSpinning {
            autoSpinning = true
            spinCount += 1
            
            Task {
                spin(
                    win: spinCount == winAutoSpin,
                    spinTime: Config.Hook.autoSpinDurs[0],
                    spinImageAmount: 40,
                    afterSpinAction: { spinning = false }
                )
            }
            
            Task {
                try? await Task.sleep(for: .seconds(
                    Config.Hook.autoSpinDurs[0] + Config.Hook.autoSpinWaitTime
                ))
                
                spin(
                    win: spinCount == winAutoSpin,
                    spinTime: Config.Hook.autoSpinDurs[1],
                    spinImageAmount: 35,
                    afterSpinAction: { spinning = false }
                )
            }
            
            Task {
                try? await Task.sleep(for: .seconds(
                    Config.Hook.autoSpinDurs[0] + Config.Hook.autoSpinDurs[1] + Config.Hook.autoSpinWaitTime * 2
                ))
                
                spin(
                    win: spinCount == winAutoSpin,
                    spinTime: Config.Hook.autoSpinDurs[2],
                    spinImageAmount: 30,
                    afterSpinAction: { spinning = false }
                )
            }
            
            Task {
                try? await Task.sleep(for: .seconds(Config.Hook.machineFadeDelay))
                
                withAnimation(.easeInOut(duration: Config.Hook.machineFadeDur)) {
                    mainTransitionProgress = 1
                }
            }
        }
    }
    
    var body: some View {
        ZStack {
            Color.background
                .ignoresSafeArea()

            if stage == 1 || stage == 2 {
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

                        ZStack {
                            SlotMachine(spinRequest: $spinRequest)
                                .opacity(1 - mainTransitionProgress)

                            HookChart()
                                .frame(width: 344, height: 200)
                                .opacity(mainTransitionProgress)
                        }
                    }

                    Spacer()

                    SpinHistory(amounts: spinHistoryAmounts)

                    Spacer()

                    Button {
                        if stage == 1 {
                            simulatedSpin()
                        } else {
                            autoSpin()
                        }
                    } label: {
                        Text(stage == 1 ? "Simulate Spin" : "Auto Spin")
                            .animation(.easeInOut(duration: 0.4))
                            .font(.system(size: 20, weight: .bold))
                            .foregroundStyle(Color(spinning || autoSpinning ? .text : .white))
                            .animation(.easeInOut(duration: 0.4), value: spinning || autoSpinning)
                            .frame(width: 340, height: 54)
                            .glassEffect(
                                .regular.tint(
                                    spinning || autoSpinning ?
                                    .glassPassive :
                                    Color(hex: "11A711").opacity(0.6)).interactive(),
                                in: Capsule()
                            )
                    }
                    .buttonStyle(.plain)
                }
                .padding(.vertical, 24)
            }

            if stage == 3 {
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
    HookView(onContinue: {})
}

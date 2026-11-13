//
//  OnboardingView.swift
//  HouseMath
//
//  Created by Luke Dunwoody on 2026-11-12.
//

import SwiftUI

struct OnboardingView: View {
    let onFinish: () -> Void
    
    init(
        onFinish: @escaping () -> Void = {}
    ) {
        self.onFinish = onFinish
    }
    
    @State private var step = 0
    
    var body: some View {
        ZStack {
            Color.background
                .ignoresSafeArea()
            
            VStack {
                Text("HOUSE MATH")
                    .foregroundStyle(.accent)
                
                if step == 1 {
                    ExpectedValueView()
                        .frame(maxHeight: .infinity)
                } else if step == 2 {
                    GamblersRuinView()
                        .frame(maxHeight: .infinity)
                } else if step == 3 {
                    MartingaleView()
                        .frame(maxHeight: .infinity)
                }
                
                ContinueButton(
                    action: nextStep,
                    backButton: step > 1,
                    backAction: backStep
                )
            }
            .ignoresSafeArea(.container, edges: .horizontal)
            .padding(.horizontal, 16)
            
            if step == 0 {
                HookView(onContinue: hideHook)
            }
            
            if step == 4 {
                ThankYouView()
            }
        }
    }
    
    private func hideHook() {
        step = 1
    }
    
    private func nextStep() {
        step += 1
    }
    
    private func backStep() {
        if step > 1 {
            step -= 1
        }
    }
}

#Preview {
    OnboardingView()
}

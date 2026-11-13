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
    @State private var showHook = true
    @State private var isMovingForward = true
    @State private var pendingStep: Int?

    private var demoTransition: AnyTransition {
        .asymmetric(
            insertion: .move(edge: isMovingForward ? .trailing : .leading),
            removal: .move(edge: isMovingForward ? .leading : .trailing)
        )
    }
    
    var body: some View {
        ZStack {
            Color.background
                .ignoresSafeArea()
            
            if step > 0 {
                VStack {
                    Text("HOUSE MATH")
                        .foregroundStyle(.accent)

                    ZStack {
                        if step == 1 {
                            ExpectedValueView()
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .transition(demoTransition)
                        } else if step == 2 {
                            GamblersRuinView()
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .transition(demoTransition)
                        } else if (3...4).contains(step) {
                            MartingaleView()
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .transition(demoTransition)
                        }
                    }
                    .frame(maxHeight: .infinity)

                    ContinueButton(
                        action: nextStep,
                        backButton: step > 1,
                        backAction: backStep
                    )
                }
                .ignoresSafeArea(.container, edges: .horizontal)
                .padding(.horizontal, 16)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.background)
                .shadow(color: showHook ? .black.opacity(0.18) : .clear, radius: 18, x: -8, y: 0)
                .transition(.move(edge: .trailing))
                .zIndex(2)
            }
            
            if showHook {
                HookView(onContinue: hideHook)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .transition(.identity)
                    .zIndex(1)
            }

            if step == 4 {
                ThankYouView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .transition(.move(edge: .trailing))
                    .shadow(color: .black.opacity(0.18), radius: 18, x: -8, y: 0)
                    .zIndex(3)
            }
        }
        .onChange(of: isMovingForward) { _, _ in
            guard let pendingStep else { return }
            withAnimation(.easeInOut(duration: 0.35)) {
                step = pendingStep
            }
            self.pendingStep = nil
        }
    }
    
    private func hideHook() {
        withAnimation(.easeInOut(duration: 0.4), completionCriteria: .logicallyComplete) {
            isMovingForward = true
            step = 1
        } completion: {
            showHook = false
        }
    }
    
    private func nextStep() {
        navigate(to: step + 1, movingForward: true)
    }

    private func backStep() {
        guard step > 1 else { return }
        navigate(to: step - 1, movingForward: false)
    }

    private func navigate(to newStep: Int, movingForward: Bool) {
        guard isMovingForward != movingForward else {
            withAnimation(.easeInOut(duration: 0.35)) {
                step = newStep
            }
            return
        }

        pendingStep = newStep
        isMovingForward = movingForward
    }
}

#Preview {
    OnboardingView()
}

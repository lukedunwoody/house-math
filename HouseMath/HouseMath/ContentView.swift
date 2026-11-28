//
//  ContentView.swift
//  HouseMath
//
//  Created by Luke Dunwoody on 2026-11-03.
//

import SwiftUI

struct ContentView: View {
    @State private var showSplash = true
    @State private var showTransition = false
    @State private var showOnboarding = true
    
    var body: some View {
        ZStack {
            if !showSplash {
                if showOnboarding {
                    OnboardingView(onFinish: hideOnboarding)
                } else {
                    PrimaryView()
                }
            }
            
            if showSplash {
                SplashScreenView()
                    .task(showTransition)
                    .task(hideSplash)
            }
            
            if showTransition {
                SplashTransitionView()
                    .task(hideTransition)
            }
        }
    }
    
    private func showTransition() async {
        try? await Task.sleep(for: .seconds(Config.Splash.transitionDelay))
        showTransition = true
    }
    
    private func hideSplash() async {
        try? await Task.sleep(for: .seconds(Config.Splash.transitionDelay + Config.Splash.fadeInDur + Config.Splash.transitionHoldDur * 0.5))
        showSplash = false
    }
    
    private func hideTransition() async {
        try? await Task.sleep(for: .seconds(Config.Splash.fadeInDur + Config.Splash.transitionHoldDur + Config.Splash.fadeOutDur))
        showTransition = false
    }
    
    private func hideOnboarding() {
        showOnboarding = false
    }
}

#Preview {
    ContentView()
}

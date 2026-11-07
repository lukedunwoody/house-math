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
    
    var body: some View {
        ZStack {
            if !showSplash {
                PrimaryView()
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
        try? await Task.sleep(
            nanoseconds: UInt64(Config.Splash.transitionDelay * 1_000_000_000)
        )
        showTransition = true
    }
    
    private func hideSplash() async {
        try? await Task.sleep(
            nanoseconds: UInt64((Config.Splash.transitionDelay + Config.Splash.fadeInDur + Config.Splash.transitionHoldDur * 0.5) * 1_000_000_000)
        )
        showSplash = false
    }
    
    private func hideTransition() async {
        try? await Task.sleep(
            nanoseconds: UInt64((Config.Splash.fadeInDur + Config.Splash.transitionHoldDur + Config.Splash.fadeOutDur) * 1_000_000_000)
        )
        showTransition = false
    }
}

#Preview {
    ContentView()
}

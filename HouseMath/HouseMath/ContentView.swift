//
//  ContentView.swift
//  HouseMath
//
//  Created by Luke Dunwoody on 2026-11-03.
//

import SwiftUI

struct ContentView: View {
    @State private var showSplash = true
    var body: some View {
        ZStack {
            PrimaryView()
            
            if showSplash {
                SplashScreenView()
                    .task(delaySplash)
            }
        }
    }
    
    private func delaySplash() async {
        try? await Task.sleep(nanoseconds: 3_000_000_000)
        showSplash = false
    }
}

#Preview {
    ContentView()
}

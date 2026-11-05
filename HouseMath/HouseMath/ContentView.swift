//
//  ContentView.swift
//  HouseMath
//
//  Created by Luke Dunwoody on 2026-11-03.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Tab("Demos", systemImage: "house") {
                DemosView()
            }
            Tab("Game", systemImage: "gamecontroller") {
                GameView()
            }
            Tab("Settings", systemImage: "gearshape") {
                SettingsView()
            }
        }
    }
}

#Preview {
    ContentView()
}

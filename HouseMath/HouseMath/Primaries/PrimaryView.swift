//
//  PrimaryView.swift
//  HouseMath
//
//  Created by Luke Dunwoody on 2026-11-06.
//

import SwiftUI

struct PrimaryView: View {
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
        .preferredColorScheme(.dark)
    }
}

#Preview {
    PrimaryView()
}

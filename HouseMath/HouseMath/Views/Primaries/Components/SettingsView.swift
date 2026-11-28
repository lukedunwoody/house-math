//
//  SettingsView.swift
//  HouseMath
//
//  Created by Luke Dunwoody on 2026-11-05.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        ZStack {
            Color.background
                .ignoresSafeArea()
            
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Settings!")
                    .foregroundStyle(.text)
            }
            .padding()
        }
    }
}

#Preview {
    SettingsView()
}

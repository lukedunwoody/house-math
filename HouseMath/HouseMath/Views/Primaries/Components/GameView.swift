//
//  GameView.swift
//  HouseMath
//
//  Created by Luke Dunwoody on 2026-11-05.
//

import SwiftUI

struct GameView: View {
    var body: some View {
        ZStack {
            Color.background
                .ignoresSafeArea()
            
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Mini Game!")
                    .foregroundStyle(.text)
            }
            .padding()
        }
    }
}

#Preview {
    GameView()
}

//
//  GamblersRuinView.swift
//  HouseMath
//
//  Created by Luke Dunwoody on 2026-11-12.
//

import SwiftUI

struct GamblersRuinView: View {
    var body: some View {
        VStack {
            Text("Gambler's Ruin Demo")
                .foregroundStyle(.text)
        }
    }
}

#Preview {
    ZStack {
        Color.background
            .ignoresSafeArea()
        
        GamblersRuinView()
    }
}

//
//  MartingaleView.swift
//  HouseMath
//
//  Created by Luke Dunwoody on 2026-11-12.
//

import SwiftUI

struct MartingaleView: View {
    var body: some View {
        VStack {
            Text("Martingale Sytem Demo")
                .foregroundStyle(.text)
        }
    }
}

#Preview {
    ZStack {
        Color.background
            .ignoresSafeArea()
        
        MartingaleView()
    }
}

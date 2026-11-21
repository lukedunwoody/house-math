//
//  HeaderLogo.swift
//  HouseMath
//
//  Created by Luke Dunwoody on 2026-11-21.
//

import SwiftUI

struct HeaderLogo: View {
    var body: some View {
        HStack(spacing: 12) {
            Circle()
                .fill(.tint)
                .frame(width: 32, height: 32)
            
            Text("HOUSE MATH")
                .font(.custom("Work Sans", size: 17))
                .foregroundStyle(.tint)
                .kerning(17*0.15)
        }
    }
}

#Preview {
    ZStack {
        Color.background
            .ignoresSafeArea()

        HeaderLogo()
    }
}

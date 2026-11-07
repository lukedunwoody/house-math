//
//  SplashScreenView.swift
//  HouseMath
//
//  Created by Luke Dunwoody on 2026-11-05.
//

import SwiftUI

struct SplashScreenView: View {
    var body: some View {
        ZStack {
            Color.background
                .ignoresSafeArea()

            VStack {
                Circle()
                    .frame(width: 80)
                    .foregroundStyle(.tint)

                Text("HOUSE MATH")
                    .font(Font.custom("Work Sans", size: 32))
                    .foregroundStyle(.tint)
                    .kerning(32*0.15)
                    .padding(.top, 2)

                Text("Know the odds.")
                    .foregroundStyle(.text)
            }
        }
    }
}

#Preview {
    SplashScreenView()
}

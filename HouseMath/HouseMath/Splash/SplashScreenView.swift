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
                    .font(.title)
                    .foregroundStyle(.tint)
                
                Text("A look inside the casino")
                    .foregroundStyle(.text)
            }
        }
    }
}

#Preview {
    SplashScreenView()
}

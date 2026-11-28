//
//  DemosView.swift
//  HouseMath
//
//  Created by Luke Dunwoody on 2026-11-05.
//

import SwiftUI

struct DemosView: View {
    var body: some View {
        ZStack {
            Color.background
                .ignoresSafeArea()

            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Welcome Back!")
                    .foregroundStyle(.text)
            }
            .padding()
        }
    }
}

#Preview {
    DemosView()
}

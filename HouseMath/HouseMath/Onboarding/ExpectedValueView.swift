//
//  ExpectedValueView.swift
//  HouseMath
//
//  Created by Luke Dunwoody on 2026-11-12.
//

import SwiftUI

struct ExpectedValueView: View {
    var body: some View {
        VStack {
            Text("Expected Value Demo")
                .foregroundStyle(.text)
        }
    }
}

#Preview {
    ZStack {
        Color.background
            .ignoresSafeArea()
        
        ExpectedValueView()
    }
}

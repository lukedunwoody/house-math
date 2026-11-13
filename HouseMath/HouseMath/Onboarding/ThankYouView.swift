//
//  ThankYouView.swift
//  HouseMath
//
//  Created by Luke Dunwoody on 2026-11-12.
//

import SwiftUI

struct ThankYouView: View {
    var body: some View {
        ZStack {
            Color.background
                .ignoresSafeArea()
            
            VStack {
                Text("Thank You!")
                    .foregroundStyle(.text)
            }
        }
    }
}

#Preview {
    ThankYouView()
}

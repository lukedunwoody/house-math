//
//  ThankYouView.swift
//  HouseMath
//
//  Created by Luke Dunwoody on 2026-11-12.
//

import SwiftUI

struct ThankYouView: View {
    let onContinue: () -> Void
    
    var body: some View {
        ZStack {
            Color.background
                .ignoresSafeArea()
            
            VStack {
                Text("Thank You!")
                    .foregroundStyle(.text)
                
                ContinueButton(
                    text: "(TEMP) Finish",
                    action: onContinue
                )
            }
        }
    }
}

#Preview {
    ThankYouView {}
}

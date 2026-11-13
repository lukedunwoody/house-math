//
//  HookView.swift
//  HouseMath
//
//  Created by Luke Dunwoody on 2026-11-12.
//

import SwiftUI

struct HookView: View {
    let onContinue: () -> Void
    
    init(
        onContinue: @escaping () -> Void = {}
    ) {
        self.onContinue = onContinue
    }
    
    var body: some View {
        ZStack {
            Color.background
                .ignoresSafeArea()
            
            VStack {
                Text("Hook")
                    .foregroundStyle(.text)
                
                ContinueButton(action: onContinue)
            }
        }
    }
}

#Preview {
    HookView()
}

//
//  ContinueButton.swift
//  HouseMath
//
//  Created by Luke Dunwoody on 2026-11-12.
//

import SwiftUI

struct ContinueButton: View {
    let text: String
    let action: () -> Void
    let backButton: Bool
    let backAction: () -> Void

    init(
        text: String = "Continue",
        action: @escaping () -> Void = {},
        backButton: Bool = false,
        backAction: @escaping () -> Void = {}
    ) {
        self.text = text
        self.action = action
        self.backButton = backButton
        self.backAction = backAction
    }

    var body: some View {
        HStack {
            if backButton {
                Button() {
                    backAction()
                } label: {
                    Label("Back", systemImage: "arrow.left")
                        .labelStyle(.iconOnly)
                        .foregroundStyle(.text)
                        .frame(width: 54, height: 54)
                        .glassEffect(.regular.interactive(), in: Circle())
                }
                .buttonStyle(.plain)
            }
            
            Button {
                action()
            } label: {
                Text(text)
                    .font(.system(size: 20, weight: .bold))
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 54)
                    .glassEffect(
                        .regular.tint(Color.continueButton).interactive(),
                        in: Capsule()
                    )
            }
            .buttonStyle(.plain)
        }
        .padding(.horizontal, 16)
    }
}

#Preview {
    ContinueButton(backButton: true)
}

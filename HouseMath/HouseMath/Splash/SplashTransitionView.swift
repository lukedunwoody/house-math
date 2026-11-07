//
//  SplashTransitionView.swift
//  HouseMath
//
//  Created by Luke Dunwoody on 2026-11-06.
//

import SwiftUI

struct SplashTransitionView: View {
    @State private var isExpanded = false
    @State private var isCotracted = false

    var body: some View {
        GeometryReader { geometry in
            let diag = sqrt(pow(geometry.size.width, 2) + pow(geometry.size.height, 2))

            ZStack {
                Circle()
                    .foregroundStyle(.tint)
                    .frame(width: diag, height: diag)
                    .scaleEffect(isExpanded ? 1 : 0, anchor: UnitPoint(x: 0.5, y: 0.47))
                    .animation(
                        .easeInOut(duration: Config.Splash.fadeInDur),
                        value: isExpanded
                    )
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
            .mask(
                ZStack {
                    Color.black

                    Circle()
                        .foregroundStyle(.black)
                        .frame(width: diag, height: diag)
                        .scaleEffect(isCotracted ? 1 : 0, anchor: .center)
                        .animation(
                            .easeInOut(duration: Config.Splash.fadeOutDur),
                            value: isCotracted
                        )
                        .blendMode(.destinationOut)
                }
                .frame(width: geometry.size.width, height: geometry.size.height)
            )
            .compositingGroup()
        }
        .ignoresSafeArea()
        .onAppear {
            isExpanded = true
        }
        .task {
            await delayContract()
        }
    }

    private func delayContract() async {
        try? await Task.sleep(
            nanoseconds: UInt64(Config.Splash.fadeInDur + Config.Splash.transitionHoldDur) * 1_000_000_000
        )
        isCotracted = true
    }
}

#Preview {
    SplashTransitionView()
}

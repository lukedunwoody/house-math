//
//  SlotMachine.swift
//  HouseMath
//
//  Created by Luke Dunwoody on 2026-11-13.
//

import SwiftUI

struct SlotReel: View, Animatable {
    var progress: Double
    let images: [String]

    var animatableData: Double {
        get { progress }
        set { progress = newValue }
    }

    private func image(at index: Int) -> String {
        let wrappedIndex = (index % images.count + images.count) % images.count
        return images[wrappedIndex]
    }

    private var windowPath: Path {
        Path { path in
            path.move(to: CGPoint(x: 4, y: 0))
            path.addLine(to: CGPoint(x: 72, y: 0))
            path.addArc(
                tangent1End: CGPoint(x: 74, y: 0),
                tangent2End: CGPoint(x: 74, y: 2),
                radius: 2
            )
            path.addCurve(
                to: CGPoint(x: 76, y: 62),
                control1: CGPoint(x: 75, y: 22),
                control2: CGPoint(x: 76, y: 52)
            )
            path.addCurve(
                to: CGPoint(x: 74, y: 122),
                control1: CGPoint(x: 76, y: 72),
                control2: CGPoint(x: 75, y: 102)
            )
            path.addArc(
                tangent1End: CGPoint(x: 74, y: 124),
                tangent2End: CGPoint(x: 72, y: 124),
                radius: 2
            )
            path.addLine(to: CGPoint(x: 4, y: 124))
            path.addArc(
                tangent1End: CGPoint(x: 2, y: 124),
                tangent2End: CGPoint(x: 2, y: 122),
                radius: 2
            )
            path.addCurve(
                to: CGPoint(x: 0, y: 62),
                control1: CGPoint(x: 1, y: 102),
                control2: CGPoint(x: 0, y: 72)
            )
            path.addCurve(
                to: CGPoint(x: 2, y: 2),
                control1: CGPoint(x: 0, y: 52),
                control2: CGPoint(x: 1, y: 22)
            )
            path.addArc(
                tangent1End: CGPoint(x: 2, y: 0),
                tangent2End: CGPoint(x: 4, y: 0),
                radius: 2
            )
            path.closeSubpath()
        }
    }

    private var frameGradient: AngularGradient {
        AngularGradient(
            gradient: Gradient(stops: [
                .init(color: Color(hex: "D5B877"), location: 0.00),
                .init(color: Color(hex: "4A3213"), location: 0.11),
                .init(color: Color(hex: "866748"), location: 0.12),
                .init(color: Color(hex: "4A3213"), location: 0.13),
                .init(color: Color(hex: "AA9C75"), location: 0.25),
                .init(color: Color(hex: "372717"), location: 0.37),
                .init(color: Color(hex: "4E3C26"), location: 0.38),
                .init(color: Color(hex: "372717"), location: 0.39),
                .init(color: Color(hex: "5E4D32"), location: 0.50),
                .init(color: Color(hex: "372717"), location: 0.61),
                .init(color: Color(hex: "4E3C26"), location: 0.62),
                .init(color: Color(hex: "372717"), location: 0.63),
                .init(color: Color(hex: "AA9C75"), location: 0.75),
                .init(color: Color(hex: "4A3213"), location: 0.87),
                .init(color: Color(hex: "866748"), location: 0.88),
                .init(color: Color(hex: "4A3213"), location: 0.89),
                .init(color: Color(hex: "D5B877"), location: 1.00)
            ]),
            center: .center,
            angle: Angle(degrees: 90)
        )
    }

    private var imageSize: Double = 54
    private var imageSpacing: Double = 12

    var body: some View {
        let step = Int(progress.rounded(.down))
        let fractionalProgress = progress - Double(step)

        ZStack {
            RoundedRectangle(cornerRadius: 4)
                .fill(frameGradient)
                .strokeBorder(
                    LinearGradient(
                        colors: [Color(hex: "998666"), Color(hex: "59492D")],
                        startPoint: UnitPoint(x: 0.5, y: 0),
                        endPoint: UnitPoint(x: 0.5, y: 1)
                    ),
                    lineWidth: 2
                )
                .shadow(color: .black.opacity(0.5), radius: 4)
                .frame(width: 84, height: 144)

            windowPath.fill(
                LinearGradient(
                    colors: [Color(hex: "83827C"), Color(hex: "F4F3F0"), Color(hex: "83827C")],
                    startPoint: UnitPoint(x: 0.5, y: -0.2),
                    endPoint: UnitPoint(x: 0.5, y: 1.2)
                )

            )
            .shadow(color: .black.opacity(0.7), radius: 2)
            .frame(width: 76, height: 124)

            VStack(spacing: imageSpacing) {
                Rectangle()
                    .fill(.clear)
                    .frame(width: 0, height: (fractionalProgress * (imageSize + imageSpacing)))

                Image("slot-\(image(at: step + 1))")
                    .resizable()
                    .frame(width: imageSize, height: imageSize)
                Image("slot-\(image(at: step))")
                    .resizable()
                    .frame(width: imageSize, height: imageSize)
                Image("slot-\(image(at: step - 1))")
                    .resizable()
                    .frame(width: imageSize, height: imageSize)

                Rectangle()
                    .fill(.clear)
                    .frame(width: 0, height: (imageSize + imageSpacing) - (fractionalProgress * (imageSize + imageSpacing)))
            }
            .frame(width: 76, height: 124)
            .clipShape(windowPath)
            .opacity(0.9)

            windowPath.fill(
                .white
                .shadow(
                    .inner(color: .black.opacity(0.3), radius: 1, x: 1, y: 0)
                )
                .shadow(
                    .inner(color: .black.opacity(0.3), radius: 1, x: -1, y: 0)
                )
                .shadow(
                    .inner(color: .black.opacity(0.6), radius: 6, x: 2, y: 1)
                )
                .shadow(
                    .inner(color: .black.opacity(0.6), radius: 6, x: -2, y: -1)
                )
            )
            .blendMode(.multiply)
            .frame(width: 76, height: 124)
        }
    }
}

struct SlotMachine: View {
    @Binding private var spinTrigger: Int

    init(spinTrigger: Binding<Int> = .constant(0)) {
        self._spinTrigger = spinTrigger
    }

    private var handlePathL: Path {
        Path { path in
            path.move(to: CGPoint(x: 8, y: 0))
            path.addArc(
                tangent1End: CGPoint(x: 11, y: 3),
                tangent2End: CGPoint(x: 11, y: 107),
                radius: 4
            )
            path.addArc(
                tangent1End: CGPoint(x: 11, y: 107),
                tangent2End: CGPoint(x: 8, y: 110),
                radius: 4
            )
            path.addLine(to: CGPoint(x: 8, y: 110))
            path.addArc(
                tangent1End: CGPoint(x: 0, y: 102),
                tangent2End: CGPoint(x: 0, y: 8),
                radius: 4
            )
            path.addArc(
                tangent1End: CGPoint(x: 0, y: 8),
                tangent2End: CGPoint(x: 8, y: 0),
                radius: 4
            )
            path.closeSubpath()
        }
    }

    private var handlePathR: Path {
        Path { path in
            path.move(to: CGPoint(x: 3, y: 0))
            path.addArc(
                tangent1End: CGPoint(x: 0, y: 3),
                tangent2End: CGPoint(x: 0, y: 107),
                radius: 4
            )
            path.addArc(
                tangent1End: CGPoint(x: 0, y: 107),
                tangent2End: CGPoint(x: 3, y: 110),
                radius: 4
            )
            path.addLine(to: CGPoint(x: 3, y: 110))
            path.addArc(
                tangent1End: CGPoint(x: 11, y: 102),
                tangent2End: CGPoint(x: 11, y: 8),
                radius: 4
            )
            path.addArc(
                tangent1End: CGPoint(x: 11, y: 8),
                tangent2End: CGPoint(x: 11, y: 0),
                radius: 4
            )
            path.closeSubpath()
        }
    }

    private static func randomImage() -> String {
        return ["seven", "diamond", "cherry", "lemon", "grape", "orange"].randomElement()!
    }

    @State private var spinning = false
    @State private var spinProgress: CGFloat = 0.5

    @State private var reelImages = (0..<3).map { _ in
        (0..<3).map { _ in Self.randomImage() }
    }

    func spin(win: Bool, time: Double, imageAmount: Int) -> Void {
        guard !spinning, imageAmount >= 4, time > 0 else { return }
        spinning = true
        spinProgress = 0.5

        var imagesBetween = (0..<3).map { _ in
            (0..<imageAmount).map { _ in Self.randomImage() }
        }

        var endImages = (0..<3).map { _ in Self.randomImage() }

        if win {
            for i in 0..<3 {
                endImages[i] = endImages[0]
            }
        } else {
            while (
                endImages[0] != endImages[1] &&
                endImages[1] != endImages[2] &&
                endImages[0] != endImages[2]
            ) {
                endImages = (0..<3).map { _ in Self.randomImage() }
            }
        }

        for i in 0..<3 {
            for j in 0..<3 {
                imagesBetween[i][j] = reelImages[i][j]
            }
            imagesBetween[i][(imageAmount - 2)] = endImages[i]
        }

        reelImages = imagesBetween

        withAnimation(.easeOut(duration: time)) {
            spinProgress = CGFloat(imageAmount) - 1.5
        }

        Task {
            try? await Task.sleep(nanoseconds: UInt64(time * 1_000_000_000))
            spinning = false
        }
    }

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .fill(
                    EllipticalGradient(
                        colors: [Color(hex: "EFEDEE"), Color(hex: "312E28")],
                        center: UnitPoint(x: 0.5, y: 0.42),
                        startRadiusFraction: 0.1,
                        endRadiusFraction: 0.7
                    )
                    .shadow(
                        .inner(color: .black.opacity(0.8), radius: 1, x: 0, y: -1)
                    )
                    .shadow(
                        .inner(color: Color(hex: "EFEDEE").opacity(0.6), radius: 1, x: 1, y: 1)
                    )
                    .shadow(
                        .inner(color: Color(hex: "EFEDEE").opacity(0.6), radius: 1, x: -1, y: 1)
                    )
                )
                .shadow(color: .black.opacity(0.7), radius: 24)
                .frame(width: 344, height: 200)

            HStack {
                handlePathL
                    .fill(
                        Color(hex: "A1804D").opacity(0.6)
                        .shadow(
                            .inner(color: Color(hex: "E0CEB1").opacity(0.7), radius: 1, x: 1, y: 1)
                        )
                    )
                    .glassEffect(in: handlePathL)
                    .frame(width: 11, height: 110)

                Spacer()

                handlePathR
                    .fill(
                        Color(hex: "A1804D").opacity(0.6)
                        .shadow(
                            .inner(color: Color(hex: "E0CEB1").opacity(0.7), radius: 1, x: -1, y: 1)
                        )
                    )
                    .glassEffect(in: handlePathR)
                    .frame(width: 11, height: 110)
            }
            .frame(width: 360, height: 110)

            RoundedRectangle(cornerRadius: 8)
                .fill(
                    EllipticalGradient(
                        colors: [Color(hex: "5D5D5B"), Color(hex: "21201C")],
                        center: UnitPoint(x: 0.5, y: 0.42),
                        startRadiusFraction: 0.2,
                        endRadiusFraction: 0.7
                    )
                    .shadow(
                        .inner(color: .black.opacity(0.3), radius: 1, x: 0, y: -1)
                    )
                    .shadow(
                        .inner(color: Color(hex: "797977").opacity(0.6), radius: 1, x: 1, y: 1)
                    )
                    .shadow(
                        .inner(color: Color(hex: "797977").opacity(0.6), radius: 1, x: -1, y: 1)
                    )
                )
                .shadow(color: .black.opacity(0.7), radius: 4)
                .frame(width: 324, height: 180)

            RoundedRectangle(cornerRadius: 6)
                .fill(
                    EllipticalGradient(
                        colors: [Color(hex: "737371"), Color(hex: "1D1C1A")],
                        startRadiusFraction: 0.1,
                        endRadiusFraction: 0.6
                    )
                )
                .frame(width: 312, height: 168)

            HStack(spacing: 8) {
                SlotReel(progress: Double(spinProgress), images: reelImages[0])
                SlotReel(progress: Double(spinProgress), images: reelImages[1])
                SlotReel(progress: Double(spinProgress), images: reelImages[2])
            }
            .frame(width: 276, height: 144)

            HStack {
                Path { path in
                    path.move(to: CGPoint(x: 0, y: 0))
                    path.addLine(to: CGPoint(x: 0, y: 36))
                    path.addArc(
                        tangent1End: CGPoint(x: 32, y: 18),
                        tangent2End: CGPoint(x: 0, y: 0),
                        radius: 1)
                    path.closeSubpath()
                }
                .fill(
                    LinearGradient(
                        stops: [
                            .init(color: Color(hex: "A78652"), location: 0.4),
                            .init(color: Color(hex: "74552D"), location: 0.6),
                            .init(color: Color(hex: "493827"), location: 1.0)
                        ],
                        startPoint: UnitPoint(x: 0, y: 0),
                        endPoint: UnitPoint(x: 0, y: 1)
                    )
                    .shadow(
                        .inner(color: Color(hex: "E5D0B3"), radius: 1, x: 0, y: 1)
                    )
                    .shadow(
                        .inner(color: Color(hex: "4F3C2C"), radius: 1, x: 0, y: -1)
                    )
                )
                .shadow(color: .black, radius: 4)
                .frame(width: 32, height: 36)

                Spacer()

                Path { path in
                    path.move(to: CGPoint(x: 32, y: 0))
                    path.addLine(to: CGPoint(x: 32, y: 36))
                    path.addArc(tangent1End: CGPoint(x: 0, y: 18), tangent2End: CGPoint(x: 32, y: 0), radius: 1)
                    path.closeSubpath()
                }
                .fill(
                    LinearGradient(
                        stops: [
                            .init(color: Color(hex: "A78652"), location: 0.4),
                            .init(color: Color(hex: "74552D"), location: 0.6),
                            .init(color: Color(hex: "493827"), location: 1.0)
                        ],
                        startPoint: UnitPoint(x: 0, y: 0),
                        endPoint: UnitPoint(x: 0, y: 1)
                    )
                    .shadow(
                        .inner(color: Color(hex: "E5D0B3"), radius: 1, x: 0, y: 1)
                    )
                    .shadow(
                        .inner(color: Color(hex: "4F3C2C"), radius: 1, x: 0, y: -1)
                    )
                )
                .shadow(color: .black, radius: 4)
                .frame(width: 32, height: 36)
            }
            .frame(width: 312, height: 168)
            .overlay(
                RoundedRectangle(cornerRadius: 6)
                    .fill(
                        .white
                        .shadow(
                            .inner(color: .black.opacity(0.8), radius: 4)
                        )
                    )
                    .blendMode(.multiply)
            )
        }
        .onChange(of: spinTrigger) { _ in
            spin(win: true, time: 4, imageAmount: 40)
        }
    }
}

private struct SlotMachinePreview: View {
    @State private var spinTrigger = 0

    var body: some View {
        ZStack {
            Color.background
                .ignoresSafeArea()

            VStack(spacing: 20) {
                SlotMachine(spinTrigger: $spinTrigger)

                Button("Spin") {
                    spinTrigger += 1
                }
            }
        }
    }
}

#Preview {
    SlotMachinePreview()
}

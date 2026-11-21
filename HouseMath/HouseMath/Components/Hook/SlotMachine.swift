//
//  SlotMachine.swift
//  HouseMath
//
//  Created by Luke Dunwoody on 2026-11-13.
//

import SwiftUI

struct SlotReel: View {
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
    
    var body: some View {
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
            
            VStack(spacing: 12) {
                Rectangle()
                    .fill(.clear)
                    .frame(width: 0, height: 0) // 0-66
                
                // TODO: Adjust transparency of the images depending on how centered they are
                Image("slot-seven")
                    .resizable()
                    .frame(width: 54, height: 54)
                Image("slot-seven")
                    .resizable()
                    .frame(width: 54, height: 54)
                Image("slot-seven")
                    .resizable()
                    .frame(width: 54, height: 54)
                
                Rectangle()
                    .fill(.clear)
                    .frame(width: 0, height: 0) // Inverse of top, 66 - x
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
                SlotReel()
                SlotReel()
                SlotReel()
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
    }
}

#Preview {
    ZStack {
        Color.background
            .ignoresSafeArea()

        SlotMachine()
    }
}

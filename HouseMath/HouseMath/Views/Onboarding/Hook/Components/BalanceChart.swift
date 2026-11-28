//
//  BalanceChart.swift
//  HouseMath
//
//  Created by Luke Dunwoody on 2026-11-27.
//

import SwiftUI
import Charts

struct DataPoint: Identifiable {
    let id = UUID()
    let spinNumber: Int
    let balance: Double
}

struct BalanceChart: View {
    let data: [DataPoint] = [
        DataPoint(spinNumber: 0, balance: 100),
        DataPoint(spinNumber: 1, balance: 95),
        DataPoint(spinNumber: 2, balance: 103),
        DataPoint(spinNumber: 3, balance: 98),
        DataPoint(spinNumber: 4, balance: 93),
        DataPoint(spinNumber: 10, balance: 90),
        DataPoint(spinNumber: 50, balance: 80)
    ]
    
    var body: some View {
        Chart {
            ForEach(data) { point in
                LineMark(
                    x: .value("Spin Number", point.spinNumber),
                    y: .value("Balance", point.balance)
                )
                .foregroundStyle(.red)
                .lineStyle(StrokeStyle(lineWidth: 4))
                .interpolationMethod(.monotone)
                
                AreaMark(
                    x: .value("Spin Number", point.spinNumber),
                    y: .value("Balance", point.balance)
                )
                .foregroundStyle(
                    .linearGradient(
                        colors: [.red.opacity(0.3), .clear],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .lineStyle(StrokeStyle(lineWidth: 4))
                .interpolationMethod(.monotone)
            }
        }
        .chartXAxis() {
            AxisMarks(position: .bottom) { value in
                let isOuter = value.index == 0 || value.index == value.count - 1
                
                let stroke = StrokeStyle(
                    lineWidth: 0.5,
                    dash: isOuter ? [] : [2, 3]
                )
                
                AxisTick(stroke: stroke)
                    .foregroundStyle(.text)
                AxisGridLine(stroke: stroke)
                    .foregroundStyle(.text)
                AxisValueLabel("\(value.as(Int.self) ?? 0) Spins")
                    .foregroundStyle(.text)
            }
        }
        .chartYAxis() {
            AxisMarks(position: .leading) {
                AxisGridLine()
                    .foregroundStyle(.text)
            }
        }
        .chartXScale(domain: 0...100)
        .chartYScale(domain: 0...200)
    }
}

#Preview {
    ZStack {
        Color.background
            .ignoresSafeArea()

        BalanceChart()
            .frame(width: 344, height: 200)
    }
}

//
//  PieChart.swift
//  PieCharts
//
//  Created by Henry Hudson on 05/10/2020.
//

import SwiftUI

struct PieChart: View {
    let pieSegments: [PieSegment]
    let strokeWidth: Double?
    
    init(dataPoints: [DataPoint], strokeWidth: Double? = nil) {
        self.strokeWidth = strokeWidth
        
        var segments = [PieSegment]()
        let total = dataPoints.reduce(0) { $0 + $1.value }
        var startAngle = -Double.pi / 2
        
        for data in dataPoints {
            let amount = .pi * 2 * (data.value / total )
            let segment = PieSegment(data: data,
                                     startAngle: startAngle,
                                     amount: amount)
            segments.append(segment)
            startAngle += amount
        }
        
        pieSegments = segments
    }
    
    @ViewBuilder var mask: some View {
        if let strokeWidth = strokeWidth {
            Circle()
                .strokeBorder(Color.white, lineWidth: CGFloat(strokeWidth))
        } else {
            Circle()
        }
    }
    
    var body: some View {
        ZStack {
            ForEach(pieSegments) { segment in
                segment
                    .fill(segment.data.color)
            }
        }
        .mask(mask)
    }
}

struct PieChart_Previews: PreviewProvider {
    
    static var previews: some View {
        PieChart(dataPoints:  [
            DataPoint(id: 1, value: 10, color: .red),
            DataPoint(id: 2, value: 20, color: .blue),
            DataPoint(id: 3, value: 30, color: .orange),
            DataPoint(id: 4, value: 40, color: .green)
        ])
        .padding()
    }
}

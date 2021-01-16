//
//  PieSegment.swift
//  PieCharts
//
//  Created by Henry Hudson on 05/10/2020.
//

import SwiftUI

struct PieSegment: Shape, Identifiable {
    let data: DataPoint
    var id: Int { data.id }
    var startAngle: Double
    var amount: Double
    
    var animatableData: AnimatablePair<Double, Double> {
        get { AnimatablePair(startAngle, amount) }
        set {
            startAngle = newValue.first
            amount = newValue.second
        }
    }
    
    func path(in rect: CGRect) -> Path {
        let radius = min(rect.width / 2, rect.height / 2)
        let center = CGPoint(x: rect.width / 2, y: rect.height / 2)
        
        var path = Path()
        path.move(to: center)
        path.addRelativeArc(center: center,
                            radius: radius,
                            startAngle: Angle(radians: startAngle),
                            delta: Angle(radians: amount))
        
        return path
    }
}

struct PieSegment_Previews: PreviewProvider {
    static var previews: some View {
        PieSegment(data:
                    DataPoint(id: 1, value: 10, color: .red), startAngle: 0, amount: .pi)
            .padding()
    }
}

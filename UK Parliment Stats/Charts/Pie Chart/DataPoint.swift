//
//  DataPoint.swift
//  PieCharts
//
//  Created by Henry Hudson on 05/10/2020.
//

import SwiftUI

struct DataPoint: Identifiable {
    let id: Int
    let value: Double
    let color: Color
    
    init(value: Double, color: Color) {
        self.id = Int.random(in: 1..<Int.max)
        self.value = value
        self.color = color
    }
    
    init(id: Int, value: Double, color: Color) {
        self.id = id
        self.value = value
        self.color = color
    }
}

//
//  PieChartView.swift
//  PieCharts
//
//  Created by Henry Hudson on 16/01/2021.
//

import SwiftUI

struct PieChartView: View {
    @State private var redAmount = Double.random(in: 10...100)
    @State private var blueAmount = Double.random(in: 10...100)
    @State private var orangeAmount = Double.random(in: 10...100)
    @State private var greenAmount = Double.random(in: 10...100)
    
    var data: [DataPoint] {
        [
            DataPoint(id: 1, value: redAmount, color: .red),
            DataPoint(id: 2, value: blueAmount, color: .blue),
            DataPoint(id: 3, value: orangeAmount, color: .orange),
            DataPoint(id: 4, value: greenAmount, color: .green)
        ]
    }
    
    var body: some View {
        PieChart(dataPoints: data, strokeWidth: 50)
            .onTapGesture {
                withAnimation {
                    redAmount = Double.random(in: 10...100)
                    blueAmount = Double.random(in: 10...100)
                    orangeAmount = Double.random(in: 10...100)
                    greenAmount = Double.random(in: 10...100)
                }
            }
            .padding()
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            
    }
}

struct PieChartView_Previews: PreviewProvider {
    static var previews: some View {
        PieChartView()
    }
}

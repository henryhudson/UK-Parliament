//
//  ContentView.swift
//  FlockingWithBoidsAlgorithm
//
//  Created by Henry Hudson on 10/10/2020.
//

import SwiftUI

struct FlockingBoidsView: View {
    @StateObject var flock = Flock(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width * 1.618)
    
    var body: some View {
        ZStack {
            ForEach(flock.boids) { boid in
                Triangle()
                    .rotation(.radians(boid.velocity.heading + (.pi / 2)))
                    .fill(flock.teamMode ? boid.color : Color.primary)
                    .frame(width: 6, height: 12)
                    .position(boid.position)
            }
            
            Circle()
                .fill(Color.orange)
                .frame(width: 25, height: 25, alignment: .center)
                .position(flock.obsticale)
        }
        .frame(width: flock.width, height: flock.height, alignment: .center)
        .ignoresSafeArea()
        .gesture(
            DragGesture(minimumDistance: 10)
                .onChanged { value in
                    flock.obsticale = value.location
                }
        )
        .onTapGesture(count: 1, perform: {
            flock.teamMode.toggle()
        })
    }
}

struct FlockingBoidsView_Previews: PreviewProvider {
    static var previews: some View {
        FlockingBoidsView()
            .preferredColorScheme(.dark)
    }
}

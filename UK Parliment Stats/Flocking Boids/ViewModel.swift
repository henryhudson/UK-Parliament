//
//  ViewModel.swift
//  FlockingWithBoidsAlgorithm
//
//  Created by Henry Hudson on 20/10/2020.
//

import SwiftUI

class Flock: ObservableObject {
    var displayLink: CADisplayLink?
    
    var teamMode = false
    
    let width: CGFloat
    let height: CGFloat
    
    var boids = [Boid]()
    
    var obsticale: CGPoint
    
    init(width: CGFloat, height: CGFloat) {
        self.width = width
        self.height = height
        
        obsticale = CGPoint(x: width / 2, y: height / 2)
        
        for _ in 1 ... 100 {
            let newBoid = Boid(x: CGFloat.random(in: 0 ..< width), y: CGFloat.random(in: 0 ..< height))
            boids.append(newBoid)
        }
        
        displayLink = CADisplayLink(target: self, selector: #selector(update))
        displayLink?.add(to: .current, forMode: .default)
        
    }
    
    @objc func update() {
        objectWillChange.send()
        
        for boid in boids {
            boid.run(in: self)
        }
    }
    
}

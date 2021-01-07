//
//  Model.swift
//  FlockingWithBoidsAlgorithm
//
//  Created by Henry Hudson on 20/10/2020.
//

import SwiftUI

class Boid: Identifiable {
    let id = UUID()
    
    let color: Color = [.green, .white, .orange, .pink, .yellow].randomElement()!
    
    var position: CGPoint
    var velocity: CGPoint
    let maximumSpeed: CGFloat = 2
    
    
    init(x: CGFloat, y: CGFloat) {
        position = CGPoint(x: x, y: y)
        
        let angle = Double.random(in: 0 ... (.pi * 2))
        velocity = CGPoint(x: cos(angle), y: sin(angle))
    }
    func run(in flock: Flock) {
        velocity += calculateAcceleration(with: flock)
        velocity.limit(to: maximumSpeed)
        
        position += velocity
        
        wrap(in: flock)
        
    }
    
    private func calculateAcceleration(with flock: Flock) -> CGPoint {
        var acceleration = seperate(from: flock) * 1.5
        acceleration += align(to: flock)
        acceleration += cohere(to: flock)
        acceleration += avoid(flock.obsticale) * 10
                
        return acceleration
    }
    
    
    
    private func seperate(from flock: Flock) -> CGPoint {
        let nearby = neighbours(in: flock, distanceCutOff: 900)
        
        guard nearby.count > 0 else {
            return .zero
        }
        
        var acceleration = nearby.reduce(CGPoint.zero) {
            var difference = position - $1.boid.position
            difference /= $1.distance
            
            return $0 + difference
        }
        acceleration /= CGFloat(nearby.count)
        
        return steer(acceleration)
        
    }
    
    private func align(to flock: Flock) -> CGPoint {
        let nearby = neighbours(in: flock, distanceCutOff: 2500)
        guard nearby.count > 0 else {
            return .zero
        }
        
        var acceleration = nearby.reduce(CGPoint.zero) {
            $0 + $1.boid.velocity
        }
        acceleration /= CGFloat(nearby.count)
        
        return steer(acceleration)
        
    }
    
    private func cohere(to flock: Flock) -> CGPoint {
        let nearby = neighbours(in: flock, distanceCutOff: 2500)
        guard nearby.count > 0 else {
            return .zero
        }
        
        var acceleration = nearby.reduce(CGPoint.zero) {
            $0 + $1.boid.position
        }
        acceleration /= CGFloat(nearby.count)
        acceleration -= position
        
        return steer(acceleration)
    }
    
    private func avoid(_ obsticale: CGPoint) -> CGPoint {
        let distance = position.distanceSquared(from: obsticale)
        let distanceCutOff: CGFloat = 750
        
        guard distance < distanceCutOff else { return .zero }
        
        var acceleration = position - obsticale
        acceleration /= distance
        return steer(acceleration)
    }
    
    private func wrap(in flock: Flock) {
        let boidSize: CGFloat = 5
        
        if position.x < -boidSize {
            position.x = flock.width + boidSize
        } else if position.x > flock.width + boidSize {
            
        }
        
        if position.y < -boidSize {
            position.y = flock.height + boidSize
        } else if position.y > flock.height + boidSize {
            position.y = -boidSize
        }
    }
    
    private func neighbours(in flock: Flock, distanceCutOff: CGFloat) -> [(boid: Boid, distance: CGFloat)] {
        flock.boids.compactMap { other in
            if flock.teamMode == true && self.color != other.color { return nil }
            let distance = position.distanceSquared(from: other.position)
            
            if distance > 0 && distance < distanceCutOff {
                return (other, distance)
            } else {
                return nil
            }
        }
    }
    
    private func steer(_ acceleration: CGPoint) -> CGPoint {
        var acceleration = acceleration
        acceleration.normalize()
        acceleration *= maximumSpeed
        acceleration -= velocity
        
        let maximumSteer: CGFloat = 0.04
        acceleration.limit(to: maximumSteer)
        
        return acceleration
    }
}

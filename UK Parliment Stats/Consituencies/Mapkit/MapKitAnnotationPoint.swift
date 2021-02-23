//
//  MapKitAnnotationPoint.swift
//  MajidMapKit
//
//  Created by Henry Hudson on 01/02/2021.
//

import SwiftUI
import MapKit

struct City: Identifiable {
  let id = UUID()
  let coordinate: CLLocationCoordinate2D
}

struct MapKitAnnotationPoint: View {
  @State private var cities: [City] = [
    City(coordinate: .init(latitude: 55.0,
                           longitude: -4.0060)),
    City(coordinate: .init(latitude: 53.7749,
                           longitude: 0.4194)),
    City(coordinate: .init(latitude: 53.6062,
                           longitude: 0.3321))
  ]
  
  @State private var userTrackingMode: MapUserTrackingMode = .follow
  @State private var region = MKCoordinateRegion(
    center: CLLocationCoordinate2D(latitude: 54.7617,
                                   longitude: -3.1918),
    span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10)
  )
  
  var body: some View {
    ZStack {
      Map(coordinateRegion: $region, annotationItems: cities) { city in
        MapAnnotation(
          coordinate: city.coordinate,
          anchorPoint: CGPoint(x: 0.0, y: 0.0)
        ) {
          Circle()
            .stroke(Color.green)
            .frame(width: 44, height: 44)
          
          let shape = MKPolygon(coordinates: [CLLocationCoordinate2D(latitude: 55, longitude: 0),CLLocationCoordinate2D(latitude: 55, longitude: 0),CLLocationCoordinate2D(latitude: 55, longitude: 0)], count: 3)
          
          
          
        }
      }
    }
    
  }
}

struct MapKitAnnotationPoint_Previews: PreviewProvider {
  static var previews: some View {
    MapKitAnnotationPoint()
  }
}

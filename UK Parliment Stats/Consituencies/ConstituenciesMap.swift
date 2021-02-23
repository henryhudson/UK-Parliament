//
//  ConstituenciesMap.swift
//  UK Parliment Stats
//
//  Created by Henry Hudson on 01/02/2021.
//

import SwiftUI
import MapKit

struct ConstituenciesMap: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: 55.0,
            longitude: -3.0
        ),
        span: MKCoordinateSpan(
            latitudeDelta: 10,
            longitudeDelta: 10
        ))
    var body: some View {
        ZStack(alignment: .bottom) {
            Map(coordinateRegion: $region)
            
            Button(action: {
                withAnimation {
                    region.span = MKCoordinateSpan(
                        latitudeDelta: 20,
                        longitudeDelta: 20
                    )
                }
            }, label: {
                Text("ZOOM")
            })
        }
        .ignoresSafeArea()
    }
}

struct ConstituenciesMap_Previews: PreviewProvider {
    static var previews: some View {
        ConstituenciesMap()
    }
}

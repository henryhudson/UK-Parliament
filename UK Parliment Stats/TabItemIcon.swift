//
//  TabItemIcon.swift
//  UK Parliment Stats
//
//  Created by Henry Hudson on 14/01/2021.
//

import SwiftUI

struct TabItemIcon: View {
    let imageName: String
    let label: String
    
    var body: some View {
        VStack {
            Image(systemName: imageName)
            Text(label)
        }
    }
}

struct TabItemIcon_Previews: PreviewProvider {
    static var previews: some View {
        TabItemIcon(imageName: "house", label: "home")
    }
}

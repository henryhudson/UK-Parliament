//
//  SideMenuNavigationLinkLabel.swift
//  UK Parliment Stats
//
//  Created by Henry Hudson on 11/12/2020.
//

import SwiftUI

struct SideMenuNavigationLinkLabel: View {
    
    var label: String
    var offColor = Color.primary
    var onColor = Color.orange
    
    var body: some View {
        HStack {
            ZStack {
                RoundedRectangle(cornerSize: CGSize(width: 0, height: 0))
                    .stroke(lineWidth: 1.5)
                    .fill(onColor)
                
                Text(label)
                    .padding(.all, 10)
                    .foregroundColor(Color.orange)
                    .font(Font.subheadline.bold() )
            }
        }
        .fixedSize()
        .animation(.linear(duration: 0.05))
    }
}

struct SideMenuNavigationLinkLabel_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuNavigationLinkLabel(label: "label")
    }
}

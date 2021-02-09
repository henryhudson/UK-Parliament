//
//  SideMenuNavLinkLabel.swift
//  Twetch7161
//
//  Created by Henry Hudson on 08/02/2021.
//

import SwiftUI

struct SideMenuNavLinkLabel: View {
    let title: String
    let iconImage: String
    var body: some View {
        HStack {
            Image(systemName: iconImage)
            
            Text(title)
        }
        .padding(.all, 10)
        .foregroundColor(.white)
        .font(Font.subheadline.bold() )
        .background(
            ZStack {
                RoundedRectangle(cornerSize: CGSize(width: 10, height: 10))
                    .fill(Color.blue)
//                    .shadow(color: Color.gray, radius: 1, x: 1, y: 1)
            }
        )
        
    }
}

struct SideMenuNavLinkLabel_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuNavLinkLabel(title: "Twetch", iconImage: "gearshape")
    }
}

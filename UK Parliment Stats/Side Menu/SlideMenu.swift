//
//  SlideMenu.swift
//  SlideMenu2
//
//  Created by Henry Hudson on 12/08/2020.
//

import SwiftUI

struct SlideMenu: View {
    @State private var width = UIScreen.main.bounds.width * 0.8
    @State private var x = -UIScreen.main.bounds.width * 0.8
    
    var body: some View {
        HStack {
            ZStack {
                Color.black
                
                VStack (alignment: .leading) {
                    Spacer()
                    
                    NavigationLink(
                        destination: Text("Destination"),
                        label: {
                            SideMenuNavLinkLabel(title: "home", iconImage: "house")
                        })
                    
                    Spacer()
                }
            }
            .frame(width: width)
            .shadow(color: Color.black.opacity(x != 0 ? 0.1 : 0), radius: 5, x: 5)
            .offset(x: x)
            
            Spacer()
        }
        .background(Color.black.opacity(x == 0 ? 0.5 : 0))
        .edgesIgnoringSafeArea(.all)
        
        .gesture(DragGesture().onChanged( { value in
            withAnimation {
                                
                if value.translation.width > 0 {
                    x = -width + value.translation.width
                } else {
                    x = value.translation.width
                }
            }
        }).onEnded( { value in
            withAnimation {
                
                if -x < width / 2 {
                    x = 0
                } else {
                    x = -width
                }
            }
        })
        )
        .animation(.linear)

    }
}



struct SlideMenu_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SlideMenu()
        }
    }
}

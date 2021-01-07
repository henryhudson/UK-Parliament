//
//  MinimalisticButtonStyle.swift
//  DigitalWorkroomVeriftyRecipt
//
//  Created by Henry Hudson on 29/09/2020.
//

import SwiftUI

struct MinimalisticButtonStyle: View {
    var body: some View {
        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
            Text("Testing")
        })
        .buttonStyle(MinimalButtonStyle() )
    }
}

struct MinimalButtonStyle: ButtonStyle {
    var offColor = Color.primary
    var onColor = Color.orange
    
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            
            ZStack {
                RoundedRectangle(cornerSize: CGSize(width: 0, height: 0))
                    .stroke(lineWidth: 1.5)
                    .fill(color(for: configuration))
                    .scaleEffect(scale(for: configuration))
                
                configuration.label
                    .padding(.all, 10)
                    .foregroundColor(color(for: configuration))
                    .font(Font.subheadline.bold() )
                    
            }
                
        }
        .fixedSize()
        .animation(.linear(duration: 0.05))
        
    }
    
    func color(for configuration: Configuration) -> Color {
        configuration.isPressed ? onColor : offColor
    }
    
    func scale(for configuration: Configuration) -> CGSize {
        configuration.isPressed ? CGSize(width: 0.98, height: 0.98) : CGSize(width: 1.0, height: 1.0)
    }
}

struct MinimalisticButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        MinimalisticButtonStyle()
    }
}

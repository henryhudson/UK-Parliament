//
//  PartyNameText.swift
//  UK Parliment Stats
//
//  Created by Henry Hudson on 18/01/2021.
//

import SwiftUI

struct PartyNameText: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .modifier(PartyNameTextViewModifier(backgroundColor: Color.orange, foregroundColor: Color.black) )
    }
}

struct PartyNameTextViewModifier: ViewModifier {
    let backgroundColor: Color
    let foregroundColor: Color
    func body(content: Content) -> some View {
        return content
            .foregroundColor(foregroundColor)
            .font(Font.caption.bold())
            .padding(6)
            .foregroundColor(.white)
            .background(
                backgroundColor
            )
    }
}

struct PartyNameText_Previews: PreviewProvider {
    static var previews: some View {
        PartyNameText()
    }
}

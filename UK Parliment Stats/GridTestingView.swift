//
//  GridTestingView.swift
//  UK Parliment Stats
//
//  Created by Henry Hudson on 16/01/2021.
//

import SwiftUI

struct GridTestingView: View {
    var gridItems: [GridItem] = [GridItem(.adaptive(minimum: 80, maximum: 160))]
    
    // MARK: Body
    var body: some View {
        ScrollView(.vertical, showsIndicators: false, content: {
            LazyVGrid(columns: gridItems) {
                ForEach(0 ..< 250) { i in
                    ZStack(alignment: .bottom) {
                        Rectangle()
                            .frame(width: 80, height: 80 * 1.618, alignment: .center)
                            .padding(8)
                        
                        Text("Henry Hudson")
                            .modifier(PartyNameTextViewModifier(backgroundColor: Color.red, foregroundColor: Color.white) )
                    }
                   
                }
            }
        })
        .padding()
    }
}

struct GridTestingView_Previews: PreviewProvider {
    static var previews: some View {
        GridTestingView()
    }
}

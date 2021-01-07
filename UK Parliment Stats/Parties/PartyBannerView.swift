//
//  PartyBannerView.swift
//  UK Parliment Stats
//
//  Created by Henry Hudson on 07/01/2021.
//

import SwiftUI

struct PartyBannerView: View {
    let party: Parties
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(party.backgroundColor)
                .padding(.horizontal)
            Text(party.name)
                .foregroundColor(party.foregroundColor)
        }
        
    }
}

struct PartyBannerView_Previews: PreviewProvider {
    static var previews: some View {
        PartyBannerView(party: .conservative)
    }
}

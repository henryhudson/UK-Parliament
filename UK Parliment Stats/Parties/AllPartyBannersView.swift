//
//  AllPartyBannersView.swift
//  UK Parliment Stats
//
//  Created by Henry Hudson on 07/01/2021.
//

import SwiftUI

struct AllPartyBannersView: View {
    var body: some View {
        VStack {
            PartyBannerView(party: .alliance)
            
            PartyBannerView(party: .conservative)
            
            PartyBannerView(party: .democraticUnionistParty)
            
            PartyBannerView(party: .greenParty)
            
            PartyBannerView(party: .democraticUnionistParty)
            
            PartyBannerView(party: .democraticUnionistParty)
        }
    }
}

struct AllPartyBannersView_Previews: PreviewProvider {
    static var previews: some View {
        AllPartyBannersView()
    }
}

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
            
            PartyBannerView(party: .labour)
            
            PartyBannerView(party: .liberalDemocrat)
            
            PartyBannerView(party: .plaidCymru)
            
            PartyBannerView(party: .scottishNationalParty)
            
            PartyBannerView(party: .sinnFein)
            
            PartyBannerView(party: .socialDemocraticAndLabourParty)
        }
    }
}

struct AllPartyBannersView_Previews: PreviewProvider {
    static var previews: some View {
        AllPartyBannersView()
    }
}

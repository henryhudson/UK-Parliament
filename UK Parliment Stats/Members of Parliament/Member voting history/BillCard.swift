//
//  BillCard.swift
//  UK Parliment Stats
//
//  Created by Henry Hudson on 09/01/2021.
//

import SwiftUI

struct BillCard: View {
    let billTitle: String
    let date: Date
    let didVoteYay: Bool
    let numberInFavour: Int
    let numberAgainst: Int
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(billTitle)
                    .font(.title2)
                Text("\(date)")
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("For: \(numberInFavour)")
                        Text("Against: \(numberAgainst)")
                    }
                    
                    Text("bill pass / fail")
                        .bold()
                }
                
            }
            .padding()
            Spacer()
        }
    }
    
}

struct BillCard_Previews: PreviewProvider {
    static var previews: some View {
        BillCard(billTitle: "Bill Title",
                 date: Date(),
                 didVoteYay: true,
                 numberInFavour: 300,
                 numberAgainst: 200)
    }
}

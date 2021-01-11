//
//  MPCandidateCard.swift
//  UK Parliment Stats
//
//  Created by Henry Hudson on 08/01/2021.
//

import SwiftUI

struct MPCandidateCard: View {
    let candidateName: String
    let votesReceived: Int
    let voteShareObtained: Double
    let partyName: String
    
    // MARK: body
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .stroke(lineWidth: 2)
                .frame(width: 150, height: 150 * 1.618, alignment: .center)
                .overlay(
                    VStack {
                        Text(candidateName)
                            .bold()
                            .padding(.bottom, 12)
                        
                        Text("Votes: ")
                        Text("\(votesReceived)")
                            .bold()
                            .font(.title3)
                            .padding(.bottom, 2)
                        
                        Text("\(voteShareObtained)%")
                        
                        Text(partyName)
                            .bold()
                            .padding(.top, 12)
                        //Spacer()
                    }
                )
        }
    }
}

struct MPCandidateCard_Previews: PreviewProvider {
    static var previews: some View {
        MPCandidateCard(candidateName: "name",
                        votesReceived: 1,
                        voteShareObtained: 0.218,
                        partyName: "party name")
    }
}

//
//  MPVotingView.swift
//  UK Parliment Stats
//
//  Created by Henry Hudson on 08/01/2021.
//

import SwiftUI

struct MPVotingView: View {
    @StateObject var networking = Networking()
    
    let memberName: String
    let memberId: Int
    @State var pageNumber: Int = 0
    @State var votesCast: Int = 0
    @State var votesOnBills: [MPVoting.Bill] = []
    var membersVotingURL: URL {
        URL(string: "https://members-api.parliament.uk/api/Members/\(memberId)/Voting?house=Commons&page=\(pageNumber)")!
    }
    
    // MARK: Body
    var body: some View {
        VStack {
            Text(memberName)
            Text("\(votesCast) votes cast")
            
                ScrollView() {
                    if votesOnBills.count != 0 {
                        ForEach ( 0 ..< votesOnBills.count ) { i in
                            BillCard(billTitle: votesOnBills[i].value.title,
                                     date: votesOnBills[i].value.date,
                                     didVoteYay: votesOnBills[i].value.inAffirmativeLobby,
                                     numberInFavour: votesOnBills[i].value.numberInFavour,
                                     numberAgainst: votesOnBills[i].value.numberAgainst)
                        }
                    }
            }
        }
        .onAppear {
            toLoadOnAppear()
        }
    }
    // MARK: Functions
    
    func toLoadOnAppear() {
        networking.fetch(membersVotingURL, defaultValue: MPVoting.default) {
            votesCast = $0.totalResults
            votesOnBills = $0.items
        }
    }
}

struct MPVotingView_Previews: PreviewProvider {
    static var previews: some View {
        MPVotingView(memberName: "member name", memberId: 435)
    }
}

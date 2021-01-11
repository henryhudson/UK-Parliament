//
//  MemberView.swift
//  UK Parliment Stats
//
//  Created by Henry Hudson on 07/01/2021.
//

import SwiftUI

struct MemberView: View {
    
    @StateObject var networking = Networking()
    
    @State var memberOfParliamentImage: String =  "https://members-api.parliament.uk/api/Members/435/Thumbnail"
    @State var memberName: String = "members title"
    @State var membersConstituency: String = "Constituency"
    @State var membershipStartDate: String = "Member since"
    
    let memberID: Int
    var memberURL: URL {
        URL(string: "https://members-api.parliament.uk/api/Members/\(memberID)")!
    }
    
    // MARK: Body
    var body: some View {
        VStack (alignment: .leading, spacing: 5) {
            HStack {
                RemoteImage(url: memberOfParliamentImage)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 130)
                
                VStack (alignment: .leading) {
                    Group {
                        Text(memberName)
                            .bold()
                        Text("of")
                        Text(membersConstituency)
                            .bold()
                    }
                    .padding(.horizontal)
                    
                    PartyBannerView(party: .conservative)
                        .frame(height: 50)
                }
            }
            
            Text("Member of parliament since " + membershipStartDate)
            
            NavigationLink(
                destination: Text("435/Biography"),
                label: {
                    Text("Parliment History")
                }
            )
            
            NavigationLink(
                destination: MPLatestElectionView(memberId: memberID),
                label: {
                    Text("Latest Election Results")
                }
            )
            
            NavigationLink(
                destination: MPVotingView(memberName: memberName, memberId: memberID),
                label: {
                    Text("Voting History")
                }
            )
            
            NavigationLink(
                destination: MPWrittenQuestionsView(memberId: memberID),
                label: {
                    Text("Written questions")
                }
            )
        }
        .padding(.horizontal)
        .onAppear {
            toLoadOnAppear()
        }
    }
    
    // MARK: Functions
    func toLoadOnAppear() {
        networking.fetch(memberURL, defaultValue: MPInfo.default) {
            print($0)
            memberOfParliamentImage = $0.value.thumbnailUrl
            memberName = $0.value.nameDisplayAs
            membersConstituency = $0.value.latestHouseMembership.membershipFrom
            membershipStartDate = $0.value.latestHouseMembership.membershipStartDate
            
        }
    }
}

struct MemberView_Previews: PreviewProvider {
    static var previews: some View {
        MemberView(memberID: 435)
    }
}

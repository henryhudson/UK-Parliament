//
//  LordView.swift
//  UK Parliment Stats
//
//  Created by Henry Hudson on 12/01/2021.
//

import SwiftUI

struct LordView: View {
    @StateObject var networking = Networking()
    
    @State var memberOfHouseImage: String =  "https://photos.dodspeople.com/photos/26848.jpg"
    @State var lordName: String = "Lord title"
    @State var lordsConstituency: String = "Constituency"
    @State var lordsStartDate: String = "Lord since"
    @State var peerage: String = "peer type"
    
    let lordID: Int
    var lordURL: URL {
        URL(string: "https://members-api.parliament.uk/api/Members/\(lordID)")!
    }
    
    // MARK: Body
    var body: some View {
        VStack (alignment: .leading, spacing: 5) {
            HStack {
                RemoteImage(url: memberOfHouseImage)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 130, height: 130)
                
                VStack (alignment: .leading) {
                    Group {
                        Text(lordName)
                            .bold()
                        Text("of")
                        Text(lordsConstituency)
                            .bold()
                    }
                    .padding(.horizontal)
                    
                    PartyBannerView(party: .crossBench)
                        .frame(height: 50)
                }
            }
            
            Text("Member of the house since " + lordsStartDate)
            Text("Membership: " + peerage)
            
            NavigationLink(
                destination: Text("Contact"),
                label: {
                    Text("Contact")
                }
            )
        }
        .padding(.horizontal)
        .onAppear {
            loadOnAppear()
        }
    }
    
    // MARK: Functions
    
    func loadOnAppear() {
        networking.fetch(lordURL, defaultValue: LordInfoModel.default) {
            memberOfHouseImage = $0.value.thumbnailUrl
            lordName = $0.value.nameDisplayAs
            lordsStartDate = $0.value.latestHouseMembership.membershipStartDate
            peerage = $0.value.latestHouseMembership.membershipFrom
        }
    }
}

struct LordView_Previews: PreviewProvider {
    static var previews: some View {
        LordView(lordID: 2175)
    }
}

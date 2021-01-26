//
//  MembersGridView.swift
//  UK Parliment Stats
//
//  Created by Henry Hudson on 18/01/2021.
//

import SwiftUI

struct MembersGridView: View {
    @StateObject var networking = Networking()
    
    var gridItems: [GridItem] = [GridItem(.adaptive(minimum: 80, maximum: 160))]
    
    @State var members = [MembersSearchModel.MemberOfParliament]()
    
    var searchAllMembersURL: URL {
        URL(string: "https://members-api.parliament.uk/api/Members/Search?House=Commons&IsCurrentMember=true&skip=\(skip)&take=20")!
    }
    @State var skip: Int = 0
    
    // MARK: Body
    var body: some View {
        
        
        VStack {
            if members.count != 0 {
                ScrollView(.vertical, showsIndicators: false, content: {
                    LazyVGrid(columns: gridItems) {
                        ForEach(0 ..< members.count) { i in
                            NavigationLink(
                                destination: MemberView(memberID: members[i].value.id),
                                label: {
                                    VStack(spacing: 0) {
                                        RemoteImage(url: members[i].value.thumbnailUrl)
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 80, height: 80 * 1.618, alignment: .center)
                                            .padding(.top, 8)
                                            .padding(.horizontal, 8)
                                        
                                        Text(members[i].value.nameDisplayAs)
                                            .modifier(PartyNameTextViewModifier(backgroundColor: Color.red, foregroundColor: Color.white) )
                                    }
                                })

                        }
                    }
                })
                .padding()
            } else {
                EmptyView()
            }
        }
        .onAppear {
            loadOnAppear()
        }
    }
    
    // MARK: Functions
    func loadOnAppear() {
        networking.fetch(searchAllMembersURL, defaultValue: MembersSearchModel.default) {
            //print($0)
            members += $0.items
        }
    }
    
    func loadMore() {
        skip += 20
        networking.fetch(searchAllMembersURL, defaultValue: MembersSearchModel.default) {
            members += $0.items
        }
    }
}

struct MembersGridView_Previews: PreviewProvider {
    static var previews: some View {
        MembersGridView()
    }
}

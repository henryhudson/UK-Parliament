//
//  LordsGridView.swift
//  UK Parliment Stats
//
//  Created by Henry Hudson on 20/01/2021.
//

import SwiftUI

struct LordsGridView: View {
    @StateObject var networking = Networking()
    
    var gridItems: [GridItem] = [GridItem(.adaptive(minimum: 80, maximum: 160))]
    
    @State var lords = [LordsSearchModel.Lord]()
    
    var searchAllLordsUrl: URL {
        URL(string: "https://members-api.parliament.uk/api/Members/Search?House=Lords&IsEligible=true&IsCurrentMember=true&skip=\(skip)&take=20")!
    }
    @State var skip: Int = 0
    
    // MARK: Body
    var body: some View {

        VStack {
            if lords.count != 0 {
                ScrollView(.vertical, showsIndicators: false, content: {
                    LazyVGrid(columns: gridItems) {
                        ForEach(0 ..< lords.count) { i in
                            NavigationLink(
                                destination: LordView(lordID: lords[i].value.id),
                                label: {
                                    VStack(alignment: .center, spacing: 0) {
                                        RemoteImage(url: lords[i].value.thumbnailUrl)
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 80, height: 80 * 1.618, alignment: .center)
                                            .padding(.top, 8)
                                            .padding(.horizontal, 8)
                                        
                                        Text(lords[i].value.nameDisplayAs)
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
        networking.fetch(searchAllLordsUrl, defaultValue: LordsSearchModel.default) {
           // print($0)
            lords += $0.items
        }
    }
    
    func loadMore() {
        skip += 20
        networking.fetch(searchAllLordsUrl, defaultValue: LordsSearchModel.default) {
            lords += $0.items
        }
    }
}

struct LordsGridView_Previews: PreviewProvider {
    static var previews: some View {
        LordsGridView()
    }
}

//
//  ListOfLords.swift
//  UK Parliment Stats
//
//  Created by Henry Hudson on 12/01/2021.
//

import SwiftUI

struct ListOfLords: View {
    @StateObject var networking = Networking()
    
    var listOfLordsURL: URL {
        URL(string: "https://members-api.parliament.uk/api/Members/Search?House=Lords&IsEligible=true&IsCurrentMember=true&skip=\(skip)&take=20")!
    }
    @State var skip: Int = 0
    
    @State var listOfLords: [LordsSearchModel.Lord] = []
    @State var numberOfEligibleLords: Int = 0
    
    // MARK: Body
    var body: some View {
        VStack {
            Text("\(numberOfEligibleLords): eligible Lords")
            List {
                ForEach(listOfLords, id: \.self) { i in
                    Text(i.value.nameDisplayAs)
                }
            }
            Button(action: {
                loadMore()
            }, label: {
                Text("load more")
            })
        }
        .onAppear {
            loadOnAppear()
        }
    }
    
    // MARK: Functions
    
    func loadOnAppear() {
        networking.fetch(listOfLordsURL, defaultValue: LordsSearchModel.default) {
            print($0)
            numberOfEligibleLords = $0.totalResults
            listOfLords += $0.items
        }
    }
    func loadMore() {
        skip += 20
        networking.fetch(listOfLordsURL, defaultValue: LordsSearchModel.default) {
            listOfLords += $0.items
        }
        
        
    }
}

struct ListOfLords_Previews: PreviewProvider {
    static var previews: some View {
        
        ListOfLords()
        
    }
}

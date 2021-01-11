//
//  ListOfAllConstituenciesView.swift
//  UK Parliament Stats
//
//  Created by Henry Hudson on 28/12/2020.
//

import SwiftUI
import Combine

struct ListOfAllConstituenciesView: View {
    @StateObject var networking = Networking()
    @State var totalNumberOfMPs: Int = 0
    @State var namesOfAllConstituencies: [String] = []
    @State var constituencyMPNames: [String] = []
    @State var urlSkipAmount: Int = 0
    
    var constituenciesURL: URL {
        URL(string: "https://members-api.parliament.uk/api/Location/Constituency/Search?skip=\(urlSkipAmount)&take=20")!
    }

    // MARK: Body
    var body: some View {
        VStack {
            List {
                ForEach( namesOfAllConstituencies, id: \.self ) { i in
                    Text(i)
                }
            }
            
            Button(action: {
                increaseSkipAmount()
                loadMore()
                
            }, label: {
                Text("load more")
            })
            .padding()
        }
        .navigationBarTitle("All Constituencies \(totalNumberOfMPs)")
        .onAppear {
            toLoadOnAppear()
        }
    }
    
    // MARK: Functions
    
    func loadMore() {
        networking.fetch(constituenciesURL, defaultValue: Constituencies.default) {
            
//            totalNumberOfMPs = $0.totalResults
            //namesOfAllConstituencies.append($0.items[0].value.name)
            
            for constituency in $0.items {
                print(constituency.value.name + ": " + constituency.value.currentRepresentation.member.value.nameDisplayAs + " ID: " + "\(constituency.value.id)")
                
                namesOfAllConstituencies.append(constituency.value.name)
                constituencyMPNames.append(constituency.value.currentRepresentation.member.value.nameDisplayAs)
                
            }
        }
    }
    
    func toLoadOnAppear() {
        networking.fetch(constituenciesURL, defaultValue: Constituencies.default) {
            totalNumberOfMPs = $0.totalResults
            //namesOfAllConstituencies.append($0.items[0].value.name)
            
            for constituency in $0.items {
                print(constituency.value.name + ": " + constituency.value.currentRepresentation.member.value.nameDisplayAs + " ID: " + "\(constituency.value.id)")
                
                namesOfAllConstituencies.append(constituency.value.name)
                constituencyMPNames.append(constituency.value.currentRepresentation.member.value.nameDisplayAs)
            }
        }
    }
    
    func increaseSkipAmount() {
        if urlSkipAmount < 631 {
            urlSkipAmount += 20
        }
    }
}

struct ListOfAllConstituenciesView_Previews: PreviewProvider {
    static var previews: some View {
        ListOfAllConstituenciesView()
    }
}



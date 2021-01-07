//
//  ListOfAllConstituenciesView.swift
//  UK Parliament Stats
//
//  Created by Henry Hudson on 28/12/2020.
//

import SwiftUI
import Combine

struct ListOfAllConstituenciesView: View {
    @State var requests = Set<AnyCancellable>()
    @State var totalNumberOfMPs: Int = 0
    @State var namesOfAllConstituencies: [String] = []
    @State var constituencyMPNames: [String] = []
    @State var urlSkipAmount: Int = 0
    
    var constituenciesURL: URL {
        URL(string: "https://members-api.parliament.uk/api/Location/Constituency/Search?skip=\(urlSkipAmount)&take=20")!
    }

    // MARK: BODY
    var body: some View {
        VStack {
            List {
                ForEach( namesOfAllConstituencies, id: \.self ) { i in
                    Text(i)
                }
            }
            
            Button(action: {
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
    
    // MARK: FUNCS
    /// Fetches JSON and stores the result in requests = Set<AnyCancellable>()
    /// - Parameters:
    ///   - url: json url
    ///   - defaultValue: fail default json response
    ///   - completion: result or defaultValue
    func fetch<T: Decodable>(_ url: URL,
                             defaultValue: T,
                             completion: @escaping (T) -> Void) {
        let decoder = JSONDecoder()
        URLSession.shared.dataTaskPublisher(for: url)
            .retry(1)
            .map(\.data)
            .decode(type: T.self, decoder: decoder)
            .replaceError(with: defaultValue)
            .sink(receiveValue: completion )
            .store(in: &requests)
    }
    
    func loadMore() {
        fetch(constituenciesURL, defaultValue: Constituencies.default) {
            
            totalNumberOfMPs = $0.totalResults
            //namesOfAllConstituencies.append($0.items[0].value.name)
            
            for constituency in $0.items {
                print(constituency.value.name + ": " + constituency.value.currentRepresentation.member.value.nameDisplayAs + " ID: " + "\(constituency.value.id)")
                
                namesOfAllConstituencies.append(constituency.value.name)
                constituencyMPNames.append(constituency.value.currentRepresentation.member.value.nameDisplayAs)
                
            }
        }
    }
    
    func toLoadOnAppear() {
        fetch(constituenciesURL, defaultValue: Constituencies.default) {
            totalNumberOfMPs = $0.totalResults
            //namesOfAllConstituencies.append($0.items[0].value.name)
            
            for constituency in $0.items {
                print(constituency.value.name + ": " + constituency.value.currentRepresentation.member.value.nameDisplayAs + " ID: " + "\(constituency.value.id)")
                
                namesOfAllConstituencies.append(constituency.value.name)
                constituencyMPNames.append(constituency.value.currentRepresentation.member.value.nameDisplayAs)
                
            }
            
        }
    }
}

struct ListOfAllConstituenciesView_Previews: PreviewProvider {
    static var previews: some View {
        ListOfAllConstituenciesView()
    }
}



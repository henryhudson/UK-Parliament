//
//  ConstituenciesJSON.swift
//  CodableNetworkingWithCombine
//
//  Created by Henry Hudson on 22/12/2020.
//

import SwiftUI
import Combine



struct ConstituenciesJSON: View {
    @State var requests = Set<AnyCancellable>()
    var constituenciesURL = URL(string: "https://members-api.parliament.uk/api/Location/Constituency/Search?skip=40&take=20")!
    
    var body: some View {
        Button(action: {
            fetch(constituenciesURL, defaultValue: Constituencies.default) {
                print($0.totalResults)
                print($0.items[0].value.name)
                print($0.items[0].value.currentRepresentation.member.value.nameDisplayAs)
                print($0.items[0].value.currentRepresentation.member.value.latestParty.name)
            }
        }, label: {
            Text("fetch")
        })
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
}

struct ConstituenciesJSON_Previews: PreviewProvider {
    static var previews: some View {
        ConstituenciesJSON()
    }
}

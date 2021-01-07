//
//  ConstituenciesSearchModels.swift
//  CodableNetworkingWithCombine
//
//  Created by Henry Hudson on 23/12/2020.
//

import SwiftUI

struct Constituencies: Decodable {
    let totalResults: Int
    let items: [Constituency]
    
    struct Constituency: Decodable {
        let value: Details
        
        struct Details: Decodable {
            let id: Int
            let name: String
            //let startDate: Date
            let currentRepresentation: MemberOfParliament
            
            struct MemberOfParliament: Decodable {
                let member: MemberOfParliamentDetails
                
                struct MemberOfParliamentDetails: Decodable {
                    let value: PersonDetails
                    
                    struct PersonDetails: Decodable {
                        let id: Int
                        let nameDisplayAs: String
                        let latestParty: PoliticalParty
                        let gender: String
                        let thumbnailUrl: String
                        
                        struct PoliticalParty: Decodable {
                            let name: String
                        }
                    }
                }
            }
        }
    }
    static let `default` = Constituencies(totalResults: 9, items: [])
    
    //static let `default` = Constituencies(totalResults: 90, items: [Constituency(id: 10, name: "Rees")])
}


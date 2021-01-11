//
//  MPVotingModel.swift
//  UK Parliment Stats
//
//  Created by Henry Hudson on 09/01/2021.
//

import SwiftUI

struct MPVoting: Decodable {
    let totalResults: Int
    
    let items: [Bill]
    struct Bill: Decodable {
        let value: Value
        struct Value: Decodable {
            let id: Int
            let inAffirmativeLobby: Bool
            let title: String
            let date: String
            let numberInFavour: Int
            let numberAgainst: Int
        }
        
    }
    
    static let `default` = MPVoting(totalResults: 0,
                                    items: [
                                        MPVoting.Bill(value: Bill.Value(id: 0,
                                                                           inAffirmativeLobby: false,
                                                                           title: "Bill title",
                                                                           date: "Date",
                                                                           numberInFavour: 0,
                                                                           numberAgainst: 0))
                                    ])
}

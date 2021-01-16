//
//  MPLatestElectionResultModel.swift
//  UK Parliment Stats
//
//  Created by Henry Hudson on 08/01/2021.
//

import SwiftUI

struct MPLatestElection: Decodable {
    let value: Value
    struct Value: Decodable {
        let result: String
        let electorate: Int
        let turnout: Int
        let majority: Int
        let electionTitle: String
        let constituencyName: String
        
        let candidates: [Candidate]
        struct Candidate: Decodable {
            let name: String
            let votes: Int
            let voteShare: Double
            
            let party: Party
            struct Party: Decodable {
                let name: String
                let abbreviation: String
            }
        }
    }
    
    static let `default` = MPLatestElection(value: Value(result: "Result",
                                                         electorate: -1,
                                                         turnout: -1,
                                                         majority: -1,
                                                         electionTitle: "Election title",
                                                         constituencyName: "Constituency",
                                                         candidates: [MPLatestElection.Value.Candidate(
                                                                        name: "candidate name",
                                                                        votes: 1,
                                                            voteShare: 0.218,
                                                            party: MPLatestElection.Value.Candidate.Party(name: "party name",
                                                                                                          abbreviation: "abb")
                                                         )])
    )
}

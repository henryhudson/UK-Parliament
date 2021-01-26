//
//  MembersSearchModel.swift
//  UK Parliment Stats
//
//  Created by Henry Hudson on 07/01/2021.
//

import SwiftUI


struct MPInfo: Decodable {
    let value: Value
    struct Value: Decodable {
        let id: Int
        let nameDisplayAs: String
        let thumbnailUrl: String
        
        let latestParty: LatestParty
        struct LatestParty: Decodable {
            let id: Int
            let name: String
            let abbreviation: String
        }
        
        let latestHouseMembership: LatestHouseMembership
        struct LatestHouseMembership: Decodable {
            let membershipFrom: String
            let membershipFromId: Int
            let membershipStartDate: Date
            
            let membershipStatus: MembershipStatus
            struct MembershipStatus: Decodable {
                let statusDescription: String
                let statusStartDate: Date
            }
        }
    }
    
    // fail value
    static let `default` = MPInfo(value: Value(id: 0,
                                               nameDisplayAs: "mp name",
                                               thumbnailUrl: "https://media.bitcoinfiles.org/5e44fd1c8ab118e696578ad45972c610293cedbba02dda11eb6e02608230fb71",
                                               latestParty: Value.LatestParty(
                                                id: 0,
                                                name: "party name",
                                                abbreviation: "abb"),
                                               latestHouseMembership: Value.LatestHouseMembership(
                                                membershipFrom: "Constituency",
                                                membershipFromId: 0,
                                                membershipStartDate: Date(),
                                                membershipStatus: MPInfo.Value.LatestHouseMembership.MembershipStatus(
                                                    statusDescription: "is member?",
                                                    statusStartDate: Date()
                                                )
                                               )
    ))
    //static let `default` = Members(thumbnailURL: "https://media.bitcoinfiles.org/5e44fd1c8ab118e696578ad45972c610293cedbba02dda11eb6e02608230fb71")
}

//
//  LordInfoModel.swift
//  UK Parliment Stats
//
//  Created by Henry Hudson on 12/01/2021.
//

import SwiftUI

struct LordInfoModel: Decodable {
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
            let membershipStartDate: String
            
            let membershipStatus: MembershipStatus
            struct MembershipStatus: Decodable {
                let statusDescription: String
                let statusStartDate: String
            }
        }
    }
    
    static let `default` = LordInfoModel(value: Value(id: 0,
                                                      nameDisplayAs: "Lord Name",
                                                      thumbnailUrl: "Thumbnail URL",
                                                      latestParty: Value.LatestParty(id: 0, name: "Party name", abbreviation: "abbreviation"),
                                                      latestHouseMembership: Value.LatestHouseMembership(membershipFrom: "Peerage type", membershipFromId: 0, membershipStartDate: "Start date", membershipStatus: Value.LatestHouseMembership.MembershipStatus(statusDescription: "current member?", statusStartDate: "start date"))))
}

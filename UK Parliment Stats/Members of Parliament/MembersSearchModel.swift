//
//  MembersSearchModel.swift
//  UK Parliment Stats
//
//  Created by Henry Hudson on 18/01/2021.
//

import SwiftUI

struct MembersSearchModel: Decodable {
    let totalResults: Int
    
    let items: [MemberOfParliament]
    struct MemberOfParliament: Decodable {
        let value: Value
        struct Value: Decodable {
            let id: Int
            let nameDisplayAs: String
            let thumbnailUrl: String
            
        }
    }
    
    static let `default` = MembersSearchModel(totalResults: -1,
                                              items: [MemberOfParliament(
                                                        value: MemberOfParliament.Value(id: -1,
                                                                                        nameDisplayAs: "Name Display",
                                                                                        thumbnailUrl: "Thumbnail"))])
}

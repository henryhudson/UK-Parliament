//
//  LordsSearchModel.swift
//  UK Parliment Stats
//
//  Created by Henry Hudson on 12/01/2021.
//

import SwiftUI

// 2175

struct LordsSearchModel: Decodable {
    let totalResults: Int
    
    let items: [Lord]
    struct Lord: Decodable, Hashable {
        
        let value: Value
        struct Value: Decodable, Hashable {
            let id: Int
            let nameDisplayAs: String
            let thumbnailUrl: String
        }
    }
    
    static let `default` = LordsSearchModel(totalResults: 0,
                                            items: [Lord(value: Lord.Value(id: 0,
                                                                           nameDisplayAs: "Lords name",
                                                                           thumbnailUrl: "thumbnail"))])
    
    
    //    static let `default` = LordsSearchModel(totalResults: 0)
}

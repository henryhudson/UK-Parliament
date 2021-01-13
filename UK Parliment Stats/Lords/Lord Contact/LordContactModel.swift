//
//  LordContactModel.swift
//  UK Parliment Stats
//
//  Created by Henry Hudson on 12/01/2021.
//

import SwiftUI

struct LordContactModel: Decodable {
    let value: [Value]
    struct Value: Decodable {
        let type: String
        let postcode: String
        let phone: String
        let fax: String
        let email: String
        let line1: String
        let line2: String
        let line3: String
        let line4: String
        let line5: String
    }
    
    static let `default` = LordContactModel(value: [Value(type: "Contact place",
                                                          postcode: "postcode",
                                                          phone: "phone number",
                                                          fax: "fax number",
                                                          email: "email",
                                                          line1: "line one",
                                                          line2: "line two",
                                                          line3: "line three",
                                                          line4: "line four",
                                                          line5: "line five")])
}

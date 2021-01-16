//
//  MPWrittenQuestions.swift
//  UK Parliment Stats
//
//  Created by Henry Hudson on 09/01/2021.
//

import SwiftUI

struct MPWrittenQuestions: Decodable {
    let totalResults: Int
    
    let items: [QandA]
    struct QandA: Decodable {
        let value: Value
        struct Value: Decodable {
            let id: Int
            let askingMemberId: Int
            let dateTabled: Date
            let questionText: String
            let answeringMemberId: Int
            let dateAnswered: Date
            let answerText: String
            
            let answeringMember: AnsweringMember
            struct AnsweringMember: Decodable {
                let id: Int
                let nameDisplayAs: String
                let thumbnailUrl: String
            }
        }
    }
    
    static let `default` = MPWrittenQuestions(totalResults: 0,
                                              items: [
                                                MPWrittenQuestions.QandA(value: QandA.Value(id: 0,
                                                                                            askingMemberId: 0,
                                                                                            dateTabled: Date(),
                                                                                            questionText: "question",
                                                                                            answeringMemberId: 0,
                                                                                            dateAnswered: Date(),
                                                                                            answerText: "answer",
                                                                                            answeringMember: QandA.Value.AnsweringMember(
                                                                                                id: 0,
                                                                                                nameDisplayAs: "name",
                                                                                                thumbnailUrl: "thumbnail")
                                                ))])
}

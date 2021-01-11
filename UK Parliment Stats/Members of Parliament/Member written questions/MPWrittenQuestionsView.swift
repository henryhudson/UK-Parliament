//
//  MPWrittenQuestionsView.swift
//  UK Parliment Stats
//
//  Created by Henry Hudson on 09/01/2021.
//

import SwiftUI

struct MPWrittenQuestionsView: View {
    @StateObject var networking = Networking()
    
    let memberId: Int
    var membersWrittenQuestionsURL: URL {
        URL(string: "https://members-api.parliament.uk/api/Members/\(memberId)/WrittenQuestions?page=\(urlPage)")!
    }
    var memberURL: URL {
        URL(string: "https://members-api.parliament.uk/api/Members/\(memberId)")!
    }
    
    @State var questionsList: [MPWrittenQuestions.QandA] = []
    @State var urlPage: Int = 1
    
    @State var numberOfWrittenQuestions: Int = 0
    @State var questionId: Int = 0
    
    @State var memberName: String = "Member"
    // MARK: Body
    var body: some View {
        VStack {
            Text("Written Questions")
            Text("Number of written Questions: \(numberOfWrittenQuestions)")
            
            ScrollView() {
                if questionsList.count != 0 {
                    ForEach( 0 ..< questionsList.count ) { i in
                        MessageView(message: questionsList[i].value.questionText,
                                    response: questionsList[i].value.answerText,
                                    askingMember: memberName,
                                    answeringMember: questionsList[i].value.answeringMember.nameDisplayAs,
                                    memberOfParliamentImage: questionsList[i].value.answeringMember.thumbnailUrl)
                    }
                }
            }
        }
        .onAppear {
            toLoadOnAppear()
        }
    }
    // MARK: Functions
    
    func toLoadOnAppear() {
        networking.fetch(membersWrittenQuestionsURL, defaultValue: MPWrittenQuestions.default) {
            numberOfWrittenQuestions = $0.totalResults
            questionsList = $0.items
        }
        networking.fetch(memberURL, defaultValue: MPInfo.default) {
            memberName = $0.value.nameDisplayAs
        }
    }
}

struct MPWrittenQuestionsView_Previews: PreviewProvider {
    static var previews: some View {
        MPWrittenQuestionsView(memberId: 435)
    }
}

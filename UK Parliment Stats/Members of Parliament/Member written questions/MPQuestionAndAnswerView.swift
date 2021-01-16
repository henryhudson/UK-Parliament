//
//  MPQuestionAndAnswerView.swift
//  UK Parliment Stats
//
//  Created by Henry Hudson on 09/01/2021.
//

import SwiftUI

struct MPQuestionAndAnswerView: View {
    let message: String
    let response: String
    let askingMember: String
    let answeringMember: String
    let memberOfParliamentImage: String
    
    let askingDate: Date
    let answeringDate: Date
    
    var body: some View {
        VStack() {
            MessageView(message: message,
                        response: response,
                        askingMember: askingMember,
                        answeringMember: answeringMember,
                        memberOfParliamentImage: memberOfParliamentImage,
                        askingDate: askingDate,
                        answeringDate: answeringDate)
        }
    }
}

struct MessageView: View {
    let message: String
    let response: String
    let askingMember: String
    let answeringMember: String
    let memberOfParliamentImage: String
    
    let askingDate: Date
    let answeringDate: Date
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text(askingMember)
                        .font(.headline)
                    Text(message)
                        .foregroundColor(.white)
                        .padding(10)
                        .background(
                            RoundedRectangle(cornerRadius: 6)
                                .foregroundColor(.blue)
                    )
                    Text("\(askingDate)")
                        .foregroundColor(.secondary)
                        .font(.caption)
                        .padding(.top, 0)
                }
                Spacer()
            }
            
            HStack {
                Spacer()
                
                VStack(alignment: .trailing) {
                    HStack {
                        Text(answeringMember)
                            .font(.headline)
                        
                        RemoteImage(url: memberOfParliamentImage)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 55)
                            .clipShape(Circle())
                    }
                    Text(response)
                        .foregroundColor(.white)
                        .padding(10)
                        .background(
                            RoundedRectangle(cornerRadius: 6)
                                .foregroundColor(.blue)
                            
                        )
                    Text("\(answeringDate)")
                        .foregroundColor(.secondary)
                        .font(.caption)
                        .padding(.top, 0)
                }
                
            }
        }
        .padding(.horizontal)
    }
}

struct MPQuestionAndAnswerView_Previews: PreviewProvider {
    static var previews: some View {
        MPQuestionAndAnswerView(message: "Why",
                                response: "because",
                                askingMember: "Asker",
                                answeringMember: "Answerer",
                                memberOfParliamentImage: "https://members-api.parliament.uk/api/Members/435/Thumbnail",
                                askingDate: Date(),
                                answeringDate: Date()
                                )
    }
}

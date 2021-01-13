//
//  LordContactView.swift
//  UK Parliment Stats
//
//  Created by Henry Hudson on 12/01/2021.
//

import SwiftUI

struct LordContactView: View {
    @StateObject var networking = Networking()
    
    let lordId: Int
    var lordURL: URL {
        URL(string: "https://members-api.parliament.uk/api/Members/\(lordId)/Contact")!
    }
    
    @State var lordContactDetails: [LordContactModel.Value] = []
    
    // MARK: Body
    var body: some View {
        Form {
            ForEach( 0 ..< lordContactDetails.count, id: \.self ) { i in
                Section(header: Text(lordContactDetails[i].type)) {
                    if lordContactDetails[i].postcode != "" {
                        HStack(alignment: .top) {
                            Text("Address: ")
                            VStack(alignment: .leading) {
                                Group {
                                    if lordContactDetails[i].line1 != "" {
                                        Text(lordContactDetails[i].line1)
                                    }
                                    if lordContactDetails[i].line2 != "" {
                                        Text(lordContactDetails[i].line2)
                                    }
                                    if lordContactDetails[i].line3 != "" {
                                        Text(lordContactDetails[i].line3)
                                    }
                                    if lordContactDetails[i].line4 != "" {
                                        Text(lordContactDetails[i].line4)
                                    }
                                    if lordContactDetails[i].line5 != "" {
                                        Text(lordContactDetails[i].line5)
                                    }
                                }
                                Text(lordContactDetails[i].postcode)
                                
                            }
                        }
                    }
                    if lordContactDetails[i].phone != "" {
                        HStack {
                            Text("Phone: ")
                            Text(lordContactDetails[i].phone)
                        }
                    }
                    if lordContactDetails[i].email != "" {
                        HStack {
                            Text("Email: ")
                            Text(lordContactDetails[i].email)
                        }
                    }
                    
                }
            }
        }
        .onAppear {
            loadOnAppear()
        }
    }
    
    // MARK: Functions
    func loadOnAppear() {
        networking.fetch(lordURL, defaultValue: LordContactModel.default) {
            lordContactDetails = $0.value
            print(lordContactDetails)
        }
    }
}

struct LordContactView_Previews: PreviewProvider {
    static var previews: some View {
        LordContactView(lordId: 2175)
    }
}

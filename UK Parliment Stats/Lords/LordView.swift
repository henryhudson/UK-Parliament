//
//  LordView.swift
//  UK Parliment Stats
//
//  Created by Henry Hudson on 12/01/2021.
//

import SwiftUI

struct LordView: View {
    @StateObject var networking = Networking()
    
    @State var memberOfHouseImage: String =  "https://members-api.parliament.uk/api/Members/435/Thumbnail"
    @State var lordName: String = "Lord title"
    @State var lordsConstituency: String = "Constituency"
    @State var lordsStartDate: String = "Lord since"
    
    let lordID: Int
    var lordURL: URL {
        URL(string: "https://members-api.parliament.uk/api/Members/\(lordID)")!
    }
    
    // MARK: Body
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
    
    // MARK: Functions
    
    func loadOnAppear() {
        networking.fetch(lordURL, defaultValue: LordsSearchModel.default) {
            print($0)
        }
    }
}

struct LordView_Previews: PreviewProvider {
    static var previews: some View {
        LordView(lordID: 2175)
    }
}

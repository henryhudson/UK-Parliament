//
//  ContentView.swift
//  UK Parliment Stats
//
//  Created by Henry Hudson on 11/12/2020.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
//            ZStack {
//                // ConstituenciesJSON()
//                //ListOfAllConstituenciesView()
//                //MemberView( memberID: 435)
//                //MPWrittenQuestionsView(memberId: 435)
//                //ListOfLords()
//                //LordView(lordID: 2175)
//                //LordContactView(lordId: 2175)
//               // SlideMenu()
//            }
            TabView {
                LordsGridView()
                    .tabItem {
                        TabItemIcon(imageName: "house",
                                    label: "Lord")
                    }
                
                MembersGridView()
                    .tabItem {
                        TabItemIcon(imageName: "house",
                                    label: "Members")
                    }
                
                ListOfAllConstituenciesView()
                    .tabItem {
                        TabItemIcon(imageName: "person.3",
                                    label: "Constituencies")
                        
                    }
                
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

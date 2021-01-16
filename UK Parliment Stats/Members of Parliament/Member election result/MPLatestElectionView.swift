//
//  MPLatestElectionView.swift
//  UK Parliment Stats
//
//  Created by Henry Hudson on 08/01/2021.
//

import SwiftUI

struct MPLatestElectionView: View {
    @StateObject var networking = Networking()
    
    let memberId: Int
    var membersLatestElectionURL: URL {
        URL(string: "https://members-api.parliament.uk/api/Members/\(memberId)/LatestElectionResult")!
    }
    
    @State var electionTitle: String = "Election title"
    @State var constituency: String = "Constituency"
    @State var electorate: Int = 1
    @State var numberOfVotes: Int = 1
    
    @State var voterTurnout = 7 / 3
    
    @State var majority: Int = 1
    @State var electionResult: String = "Election Result"
    
    @State var electionCandidates: [MPLatestElection.Value.Candidate] = []
    @State var dataPoints: [DataPoint] = []
    
    // MARK: Body
    var body: some View {
        VStack {
            Text(electionTitle)
            Text("results for")
            Text(constituency)
            
            Text(electionResult)
                .bold()
                .font(.title2)
                .padding(8)
            
            VStack(alignment: .leading) {
                Text("Total Electorate: \(electorate)")
                Text("Votes counted: \(numberOfVotes)")
                // todo fix percentages
                Text("Turnout: \(voterTurnout) %")
                Text("Majority: \(majority)")
            }
            .padding(.top)
            
            if electionCandidates.count != 0 {
                PieChart(dataPoints: dataPoints)
                
                
                            
                ScrollView(.horizontal) {
                    HStack {
                        ForEach( 0 ..< electionCandidates.count ) { i in
                            MPCandidateCard(candidateName: electionCandidates[i].name,
                                            votesReceived: electionCandidates[i].votes,
                                            voteShareObtained: electionCandidates[i].voteShare,
                                            partyName: electionCandidates[i].party.name)
                        }
                    }
                    .padding()
                }
            }
        }
        .onAppear {
            toLoadOnAppear()
            
            //voterTurnout = Double(743 / 547)
        }
    }
    
    // MARK: Functions
    func toLoadOnAppear() {
        networking.fetch(membersLatestElectionURL, defaultValue: MPLatestElection.default) {
            electionTitle = $0.value.electionTitle
            constituency = $0.value.constituencyName
            electorate = $0.value.electorate
            numberOfVotes = $0.value.turnout
            majority = $0.value.majority
            electionResult = $0.value.result
            electionCandidates = $0.value.candidates
            
            for candidate in electionCandidates {
                dataPoints.append(DataPoint(value: candidate.voteShare, color: Color("background\(candidate.party.abbreviation)")))
            }
            
            
        }
        //voterTurnout = electorate
    }
}

struct MPLatestElectionView_Previews: PreviewProvider {
    static var previews: some View {
        MPLatestElectionView(memberId: 435)
    }
}

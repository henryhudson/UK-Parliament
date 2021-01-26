//
//  PartiesModel.swift
//  UK Parliment Stats
//
//  Created by Henry Hudson on 07/01/2021.
//

import SwiftUI

enum Parties {
    case alliance
    case conservative
    case democraticUnionistParty
    case greenParty
    case independent
    case labour
    case liberalDemocrat
    case plaidCymru
    case scottishNationalParty
    case sinnFein
    case socialDemocraticAndLabourParty
    case crossBench
}

// MARK: Name
extension Parties {
    var name: String {
        switch self {
        case .alliance:
            return "Alliance"
        case .conservative:
            return "Conservative"
        case .democraticUnionistParty:
            return "Democratic Unionist Party"
        case .greenParty:
            return "Green Party"
        case .independent:
            return "Independent"
        case .labour:
            return "Labour"
        case .liberalDemocrat:
            return "Liberal Democrat"
        case .plaidCymru:
            return "Plaid Cymru"
        case .scottishNationalParty:
            return "Scottish National Party"
        case .sinnFein:
            return "Sinn Féin"
        case .socialDemocraticAndLabourParty:
            return "Social Democratic & Labour Party"
        case .crossBench:
            return "Cross Bench"
        }
    }
}

// MARK: Background Color
extension Parties {
    var backgroundColor: Color {
        switch self {
        case .alliance:
            return Color("backgroundALL")
        case .conservative:
            return Color("backgroundCon")
        case .democraticUnionistParty:
            return Color("backgroundDUP")
        case .greenParty:
            return Color("backgroundGreen")
        case .independent:
            return Color("backgroundInd")
        case .labour:
            return Color("backgroundLab")
        case .liberalDemocrat:
            return Color("backgroundLD")
        case .plaidCymru:
            return Color("backgroundPC")
        case .scottishNationalParty:
            return Color("backgroundSNP")
        case .sinnFein:
            return Color("backgroundSF")
        case .socialDemocraticAndLabourParty:
            return Color("backgroundSDLP")
        case .crossBench:
            return Color("backgroundXB")
        }
    }
}

//MARK: Foreground Color
extension Parties {
    var foregroundColor: Color {
        switch self {
        case .alliance:
            return Color("foregroundALL")
        case .conservative:
            return Color("foregroundCon")
        case .democraticUnionistParty:
            return Color("foregroundDUP")
        case .greenParty:
            return Color("foregroundGreen")
        case .independent:
            return Color("foregroundIND")
        case .labour:
            return Color("foregroundLab")
        case .liberalDemocrat:
            return Color("foregroundLD")
        case .plaidCymru:
            return Color("foregroundPC")
        case .scottishNationalParty:
            return Color("foregroundSNP")
        case .sinnFein:
            return Color("foregroundSF")
        case .socialDemocraticAndLabourParty:
            return Color("foregroundSDLP")
        case .crossBench:
            return Color("foregroundXB")
        }
    }
}

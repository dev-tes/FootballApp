//
//  Route.swift
//  TheClosedCircuit
//
//  Created by  Tes on 10/12/2021.
//

import Foundation

enum Route {
    static let baseUrl = "https://api.football-data.org/v2/"
    
    case competition
    case teams
    case teamDetail
    
    var description: String {
        switch self {
        case .competition:
            return "competitions/"
        case .teams:
            return "competitions/2021/teams"
        case .teamDetail:
            return "teams/57"
        }
    }
}

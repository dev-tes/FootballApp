//
//  League.swift
//  FootballApp
//
//  Created by  Tes on 11/12/2021.
//

import Foundation

// MARK: - APIResponse
struct League: Codable {
    let teams: [Team]
}

// MARK: - Team
struct Team: Codable {
    let id: Int
    let area: Area
    let crestURL: String

    enum CodingKeys: String, CodingKey {
        case id, area
        case crestURL = "crestUrl"
    }
}

// MARK: - Area
struct Area: Codable {
    let id: Int
    let name: String
}

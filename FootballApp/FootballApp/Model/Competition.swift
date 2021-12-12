//
//  Competition.swift
//  FootballApp
//
//  Created by  Tes on 11/12/2021.
//

import Foundation


struct CompetitionResponse: Codable {
    let count: Int
    let filters: Filter
    let competitions: [Compete]
}

// MARK: - Competition
struct Compete: Codable {
    let id: Int
    let area: Are
    let name: String
    let code: String?
    let emblemURL: String?
    let plan: Plan
    let currentSeason: CurrentSeason?
    let numberOfAvailableSeasons: Int
    let lastUpdated: String
    
    enum CodingKeys: String, CodingKey {
        case id, area, name, code
        case emblemURL = "emblemUrl"
        case plan, currentSeason, numberOfAvailableSeasons, lastUpdated
    }
}

// MARK: - Area
struct Are: Codable {
    let id: Int
    let name, countryCode: String
    let ensignURL: String?
    
    enum CodingKeys: String, CodingKey {
        case id, name, countryCode
        case ensignURL = "ensignUrl"
    }
}

// MARK: - CurrentSeason
struct CurrentSeason: Codable {
    let id: Int
    let startDate, endDate: String
    let currentMatchday: Int?
    let winner: Winner?
}

// MARK: - Winner
struct Winner: Codable {
    let id: Int
    let name: String
    let shortName, tla: String?
    let crestURL: String?
    
    enum CodingKeys: String, CodingKey {
        case id, name, shortName, tla
        case crestURL = "crestUrl"
    }
}

enum Plan: String, Codable {
    case tierFour = "TIER_FOUR"
    case tierOne = "TIER_ONE"
    case tierThree = "TIER_THREE"
    case tierTwo = "TIER_TWO"
}

// MARK: - Filters
struct Filter: Codable {
}


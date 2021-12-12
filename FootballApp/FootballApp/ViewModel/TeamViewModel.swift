//
//  TeamViewModel.swift
//  FootballApp
//
//  Created by  Tes on 12/12/2021.
//

import Foundation
class TeamViewModel{
    
    let name, shortName, tla: String
    let crestURL: String
    let address, phone: String
    let website: String
    let email: String
    let founded: Int
    let clubColors, venue: String
    var imageData: Data? = nil

    init(name: String,
         shortName: String,
         tla: String,
         crestURL: String,
         address: String,
         phone: String,
         website: String,
         email: String,
         founded: Int,
         clubColors: String,
         venue: String
    ){
        self.name = name
        self.shortName = shortName
        self.tla = tla
        self.crestURL = crestURL
        self.address = address
        self.phone = phone
        self.website = website
        self.email = email
        self.founded = founded
        self.clubColors = clubColors
        self.venue = venue
    }
}

class PlayerViewModel{
    
    let playerName, position: String
    let dateOfBirth: String
    let countryOfBirth, nationality: String
    
    init(
        playerName: String,
        position: String,
        dateOfBirth: String,
        countryOfBirth:String,
        nationality: String
    ){
    
    self.playerName = playerName
        self.position = position
        self.dateOfBirth = dateOfBirth
        self.countryOfBirth = countryOfBirth
        self.nationality = nationality
    }
    
}


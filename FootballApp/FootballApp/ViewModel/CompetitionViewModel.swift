//
//  CompetitionViewModel.swift
//  FootballApp
//
//  Created by  Decagon on 11/12/2021.
//

import Foundation

class CompetitionViewModel{
    let id: Int32
    let leagueName: String
    let country: String
    let date: String
    
    init(id: Int32,leagueName: String, country: String,date: String){
        self.id = id
        self.leagueName = leagueName
        self.country = country
        self.date = date
    }
}

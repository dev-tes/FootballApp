//
//  TeamViewModel.swift
//  FootballApp
//
//  Created by  Tes on 12/12/2021.
//

import Foundation
class TeamViewModel{
    
    let id: Int
    let leagueName: String
    let country: String
    let date: String

    init(id: Int,leagueName: String, country: String,date: String){
        self.id = id
        self.leagueName = leagueName
        self.country = country
        self.date = date
    }
    
    
}


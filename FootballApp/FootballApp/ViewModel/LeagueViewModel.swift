//
//  LeagueViewModel.swift
//  FootballApp
//
//  Created by  Tes on 11/12/2021.
//

import Foundation

class LeagueViewModel{
    let id: Int
    let crestURL: String
    var imageData: Data? = nil
    
    init(id: Int, crestURL: String){
        self.id = id
        self.crestURL = crestURL
    }
}

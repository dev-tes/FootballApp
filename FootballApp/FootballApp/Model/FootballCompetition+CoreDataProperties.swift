//
//  FootballCompetition+CoreDataProperties.swift
//  FootballApp
//
//  Created by  Decagon on 10/12/2021.
//
//

import Foundation
import CoreData


extension FootballCompetition {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FootballCompetition> {
        return NSFetchRequest<FootballCompetition>(entityName: "FootballCompetition")
    }

    @NSManaged public var leagueName: String?
    @NSManaged public var country: String?
    @NSManaged public var startDate: String?
    @NSManaged public var id: Int16

}

extension FootballCompetition : Identifiable {

}

//
//  FootballApp+CoreDataProperties.swift
//  
//
//  Created by  Decagon on 12/12/2021.
//
//

import Foundation
import CoreData


extension FootballApp {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FootballApp> {
        return NSFetchRequest<FootballApp>(entityName: "FootballApp")
    }

    @NSManaged public var startDate: String?
    @NSManaged public var leagueName: String?
    @NSManaged public var id: Int32
    @NSManaged public var country: String?

}

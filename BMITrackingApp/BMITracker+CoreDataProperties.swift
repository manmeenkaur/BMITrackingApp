//
//  BMITracker+CoreDataProperties.swift
//  BMITrackingApp
//
//  Created by Manmeen Kaur on 2022-12-15.
//
//

import Foundation
import CoreData


extension BMITracker {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<BMITracker> {
        return NSFetchRequest<BMITracker>(entityName: "BMITracker")
    }

    @NSManaged public var name: String?
    @NSManaged public var age: Int32
    @NSManaged public var height: Float
    @NSManaged public var weight: Float
    @NSManaged public var bmiResult: Float
    @NSManaged public var id: Int32
    @NSManaged public var date: Date?

}

extension BMITracker : Identifiable {

}

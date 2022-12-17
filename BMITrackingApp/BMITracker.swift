//
//  BMITracker.swift
//  BMITrackingApp
//
//  Created by Manmeen Kaur (301259638) on 2022-12-15.
//  Version: 1.0.0
//  Changes: Created Core Data with BMITracker entity attributes.

import CoreData

@objc(BMITracker)
class BMITracker: NSManagedObject
{
    @NSManaged var id: NSNumber!
    @NSManaged var name: String!
    @NSManaged var age: NSNumber!
    @NSManaged var height: NSNumber!
    @NSManaged var weight: NSNumber!
    @NSManaged var bmiResult: NSNumber!
    @NSManaged var date: Date?
}

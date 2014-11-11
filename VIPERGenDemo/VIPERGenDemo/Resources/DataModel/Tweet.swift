//
//  Tweet.swift
//  VIPERGenDemo
//
//  Created by Pedro Piñera Buendía on 12/11/14.
//  Copyright (c) 2014 ___Redbooth___. All rights reserved.
//

import Foundation
import CoreData

class Tweet: NSManagedObject {

    @NSManaged var avatar: String
    @NSManaged var body: String
    @NSManaged var date: NSDate
    @NSManaged var identifier: String
    @NSManaged var username: String

}

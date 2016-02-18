//
//  College.swift
//  College Profile Builder
//
//  Created by Student on 1/25/16.
//  Copyright © 2016 Student. All rights reserved.
//

import UIKit

class College: NSObject
{
    var name = ""
    var location = ""
    var numberOfStudents = 0
    var picture = UIImage(named: "Default")
    var webpage = ""
    
    init(Name: String, Location: String, Students: Int, Picture: UIImage)
    {
        super.init()
        name = Name
        location = Location
        numberOfStudents = Students
        picture = Picture
    }
    
    init(Name: String, Location: String)
    {
        super.init()
        name = Name
        location = Location
    }
}

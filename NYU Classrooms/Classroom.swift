//
//  Classroom.swift
//  NYU Classrooms
//
//  Created by Jonathan Philippou on 5/1/17.
//  Copyright © 2017 Conturbo Dev. All rights reserved.
//

import Foundation

class Classroom: NSObject {
    
    var className: String?
    var buildingCode: String?
    
    init(className: String, buildingCode: String) {
        self.className = className
        self.buildingCode = buildingCode
    }
    
}

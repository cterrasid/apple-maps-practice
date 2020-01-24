//
//  DataModel.swift
//  Where was I?
//
//  Created by Clarette Terrasi on 24/01/2020.
//  Copyright © 2020 Clarette Terrasi Díaz. All rights reserved.
//

import Foundation

class VisitedPoint {
    var latitude: String
    var longitude: String
    
    init(lat: String, long: String) {
        self.latitude = lat
        self.longitude = long
    }
}

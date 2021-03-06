//
//  DataStore.swift
//  Where was I?
//
//  Created by Clarette Terrasi on 24/01/2020.
//  Copyright © 2020 Clarette Terrasi Díaz. All rights reserved.
//

import Foundation

struct StorageKeys {
    static let storedLat = "storedLat"
    static let storedLong = "storedLong"
}

class DataStore {

    func GetDefaults () -> UserDefaults {
        return UserDefaults.standard
    }
    
    func StoreDataPoint(latitude: String, longitude: String) {
        
        let def = GetDefaults()
        
        def.setValue(latitude, forKey: StorageKeys.storedLat)
        def.setValue(longitude, forKey: StorageKeys.storedLong)
        
        def.synchronize()
        
        print("\(latitude) \(longitude)")
        print(StorageKeys.storedLat)
    }
    
    func GetLastLocation() -> VisitedPoint? {
        let defaults = GetDefaults()
        
        if let lat = defaults.string(forKey: StorageKeys.storedLat) {
            if let long = defaults.string(forKey: StorageKeys.storedLong) {
                return VisitedPoint(lat: lat, long: long)
            }
        }
        return nil
    }
}

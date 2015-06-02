//
//  String+Additions.swift
//  iOSCategories
//
//  Created by Josh L on 6/1/15.
//  Copyright (c) 2015 Applico Inc. All rights reserved.
//

import Foundation

extension String {
    
    func randomStringOfLength(length: Int) -> String {
        let characterSet = Array("0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ")
        var randomString = String()
        randomString.reserveCapacity(length)
        
        for index in 0...length - 1 {
            randomString.append(characterSet[Int(arc4random_uniform(UInt32(characterSet.count)))])
        }
        
        return randomString
    }
    
    //    init?(randomStringOfLength: Int) {
    //        if randomStringOfLength == 0 {
    //            return nil
    //        } else {
    //            super.init()
    //            self = randomStringOfLength(randomStringOfLength)
    //        }
    //    }
    
    func GUIDString() -> String {
        
        var guid: String
        
        let newUniqueID = CFUUIDCreate(kCFAllocatorDefault)
        let newUniqueIDString = CFUUIDCreateString(kCFAllocatorDefault, newUniqueID)
        if let guid = newUniqueIDString as? String {
            return guid
        }
        
        return ""
    }
}
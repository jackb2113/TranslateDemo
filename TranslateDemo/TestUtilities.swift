//
//  TestUtilities.swift
//  TranslateDemo
//
//  Created by Jack Bailey on 10/5/15.
//  Copyright © 2015 Jack Bailey. All rights reserved.
//

import Foundation


class TestUtilities {
    
    class func isRunningTests() -> Bool {
        if NSProcessInfo.processInfo().environment["XCInjectBundle"] != nil {
            return true;
        }
        
        return false;
    }
}
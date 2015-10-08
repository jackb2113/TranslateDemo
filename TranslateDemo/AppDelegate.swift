//
//  AppDelegate.swift
//  TranslateDemo
//
//  Created by Jack Bailey on 10/3/15.
//  Copyright © 2015 Jack Bailey. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        setupLogging()
        return true
    }

    private func setupLogging() {
        DDTTYLogger.sharedInstance().colorsEnabled = true
        
        DDLog.addLogger(DDASLLogger.sharedInstance())
        DDLog.addLogger(DDTTYLogger.sharedInstance())
        
        let fileLogger = DDFileLogger()
        fileLogger.rollingFrequency = 60 * 60 * 24; // 24 hour rolling
        fileLogger.logFileManager.maximumNumberOfLogFiles = 7;
        
        DDLog.addLogger(fileLogger)
        
        DDLogSwift.logVerbose("taste")
        DDLogSwift.logDebug("the")
        DDLogSwift.logInfo("rain-")
        DDLogSwift.logWarn("bow")
        DDLogSwift.logError("!!!")
        
    }


}


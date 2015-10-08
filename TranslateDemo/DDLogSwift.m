//
//  DDLogSwift.m
//  TranslateDemo
//
//  Created by Jack Bailey on 10/3/15.
//  Copyright © 2015 Jack Bailey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DDLogSwift.h"


@implementation DDLogSwift

+ (void)logVerbose:(NSString *)logString {
    DDLogVerbose(logString);
}

+ (void)logDebug:(NSString *)logString {
    DDLogDebug(logString);
}

+ (void)logError:(NSString *)logString {
    DDLogError(logString);
}

+ (void)logWarn:(NSString *)logString {
    DDLogWarn(logString);
}

+ (void)logInfo:(NSString *)logString {
    DDLogInfo(logString);
}

@end
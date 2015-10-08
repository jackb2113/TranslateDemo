//
//  DDLogSwift.h
//  TranslateDemo
//
//  Created by Jack Bailey on 10/3/15.
//  Copyright © 2015 Jack Bailey. All rights reserved.
//

#ifndef DDLogSwift_h
#define DDLogSwift_h

#import <CocoaLumberjack/CocoaLumberjack.h>

static const DDLogLevel ddLogLevel = DDLogLevelVerbose;

@interface DDLogSwift : NSObject

+ (void)logVerbose:(NSString *)logString;
+ (void)logDebug:(NSString *)logString;
+ (void)logError:(NSString *)logString;
+ (void)logWarn:(NSString *)logString;
+ (void)logInfo:(NSString *)logString;

@end

#endif /* DDLogSwift_h */

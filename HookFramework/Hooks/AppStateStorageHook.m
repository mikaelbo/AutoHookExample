//
//  AppStateStorageHook.m
//  HookFramework
//
//  Copyright © 2017 Mikaelbo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBAutoHook.h"

@interface AppStateStorageHook: NSObject <MBAutoHook>

@end

@implementation AppStateStorageHook

+ (NSArray<NSString *> *)targetClasses {
    return @[@"AppStateStorage"];
}

+ (BOOL)hook_isPremiumMember {
    return YES;
}

+ (BOOL)hook_shouldShowAds {
    NSLog(@"ORIG SHOULD SHOW ADS: %d", [self orig_shouldShowAds]);
    return NO;
}

// MARK:  Placeholders

+ (BOOL)orig_isPremiumMember { return NO; }
+ (BOOL)orig_shouldShowAds { return NO; }

@end

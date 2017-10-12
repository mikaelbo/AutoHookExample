//
//  AppStateStorage.h
//  HookExample
//
//  Copyright © 2017 Mikaelbo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppStateStorage : NSObject

+ (BOOL)isPremiumMember;
+ (BOOL)shouldShowAds;

@end

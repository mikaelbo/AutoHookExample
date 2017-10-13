//
//  NSObject+SafeSelector.h
//  HookFramework
//
//  Copyright © 2017 Mikaelbo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (SafeSelector)

- (id)performSelectorFromString:(NSString *)selector;
- (id)performSelectorFromString:(NSString *)selector withObject:(id)object;
- (id)performSelectorFromString:(NSString *)selector withExpectedReturnClass:(Class)expectedClass;
- (id)performSelectorFromString:(NSString *)selector withObject:(id)object expectedReturnClass:(Class)expectedClass;

@end

//
//  NSObject+SafeSelector.h
//  HookFramework
//
//  Copyright © 2017 Mikaelbo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (SafeSelector)

- (void)performSelectorFromString:(NSString *)selector;
- (void)performSelectorFromString:(NSString *)selector withObject:(id)object;
- (id)performSelectorFromString:(NSString *)selector withExpectedClass:(Class)expectedClass;
- (id)performSelectorFromString:(NSString *)selector withObject:(id)object expectedClass:(Class)expectedClass;

@end

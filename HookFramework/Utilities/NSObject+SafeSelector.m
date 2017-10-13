//
//  NSObject+SafeSelector.m
//  HookFramework
//
//  Copyright © 2017 Mikaelbo. All rights reserved.
//

#import "NSObject+SafeSelector.h"

#define SuppressPerformSelectorLeakWarning(Stuff) \
do { \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
Stuff; \
_Pragma("clang diagnostic pop") \
} while (0)

// Thanks, Scott Thompson!
// https://stackoverflow.com/a/7933931

@implementation NSObject (SafeSelector)

- (id)performSelectorFromString:(NSString *)selector {
    return [self performSelectorFromString:selector withExpectedReturnClass:nil];
}

- (id)performSelectorFromString:(NSString *)selector withObject:(id)object {
    return [self performSelectorFromString:selector withObject:object expectedReturnClass:nil];
}

- (id)performSelectorFromString:(NSString *)selectorString withExpectedReturnClass:(Class)expectedClass {
    SuppressPerformSelectorLeakWarning(
        SEL selector = NSSelectorFromString(selectorString);
        if ([self respondsToSelector:selector]) {
            id obj = [self performSelector:selector];
            if (!expectedClass || [obj isKindOfClass:expectedClass]) {
                return obj;
            }
        }
        return nil;
    );
}

- (id)performSelectorFromString:(NSString *)selectorString withObject:(id)object expectedReturnClass:(Class)expectedClass {
    SuppressPerformSelectorLeakWarning(
    SEL selector = NSSelectorFromString(selectorString);
        if ([self respondsToSelector:selector]) {
            id obj = [self performSelector:selector withObject:object];
            if (!expectedClass || [obj isKindOfClass:expectedClass]) {
                return obj;
            }
        }
        return nil;
    );
}

@end

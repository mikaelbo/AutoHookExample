//
//  ViewControllerHook.m
//  HookFramework
//
//  Copyright © 2017 Mikaelbo. All rights reserved.
//

@import UIKit;
#import "MBAutoHook.h"
#import "NSObject+SafeSelector.h"

@interface ViewControllerHook: UIViewController <MBAutoHook>

@end

@implementation ViewControllerHook

+ (NSArray<NSString *> *)targetClasses {
    return @[@"ViewController"];
}

- (void)hook_viewDidLoad {
    [self orig_viewDidLoad];
    
    NSLog(@"ViewController hook_viewDidLoad");

    UIView *blueView = [self performSelectorFromString:@"blueView" withExpectedReturnClass:[UIView class]];

    [UIView animateWithDuration:1.5 animations:^{
        blueView.backgroundColor = [UIColor redColor];
    }];
}

- (void)hook_viewWillAppear:(BOOL)animated {
    [self orig_viewWillAppear:animated];
    NSLog(@"ViewController hook_viewWillAppear");
}

- (void)hook_viewDidAppear:(BOOL)animated {
    [self orig_viewDidAppear:animated];
    NSLog(@"ViewController hook_viewDidAppear");
}

// MARK:  Placeholders

- (void)orig_viewDidLoad { }
- (void)orig_viewWillAppear:(BOOL)animated { }
- (void)orig_viewDidAppear:(BOOL)animated { }

@end

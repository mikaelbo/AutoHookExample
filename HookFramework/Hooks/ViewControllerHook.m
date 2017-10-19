//
//  ViewControllerHook.m
//  HookFramework
//
//  Copyright © 2017 Mikaelbo. All rights reserved.
//

@import UIKit;
#import "MBAutoHook.h"

@interface UIViewController (ViewControllerHook)
@property (weak, nonatomic) UIView *blueView;
@end

@interface ViewControllerHook: UIViewController <MBAutoHook>
@end

@implementation ViewControllerHook

+ (NSArray<NSString *> *)targetClasses {
    return @[@"ViewController"];
}

- (void)hook_viewDidLoad {
    [self orig_viewDidLoad];
    
    NSLog(@"ViewController hook_viewDidLoad");

    if (![self respondsToSelector:@selector(blueView)]) {
        return;
    }

    __weak __typeof(self) weakSelf = self;
    [UIView animateWithDuration:1.5 animations:^{
        weakSelf.blueView.backgroundColor = [UIColor redColor];
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

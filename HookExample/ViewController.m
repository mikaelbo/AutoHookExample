//
//  ViewController.m
//  HookExample
//
//  Copyright © 2017 Mikaelbo. All rights reserved.
//

#import "ViewController.h"
#import "AppStateStorage.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *blueView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"ViewController viewDidLoad");
    NSLog(@"Is premium member: %d", [AppStateStorage isPremiumMember]);
    NSLog(@"Should show ads: %d", [AppStateStorage shouldShowAds]);
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

@end

# AutoHookExample
Sample project for creating a dynamic framework for method swizzling and code injection. 

* Create a class that conforms to `MBAutoHook`
* Implement `+ (NSArray<NSString *> *)targetClasses` to specify which classes you want to hook
* `hook_` + method name for the method you want to hook, e.g. `- (void)hook_viewDidLoad`
* `orig_` + method name as a placeholder for the original implementation, e.g. `- (void)orig_viewDidLoad`

````Objective-C
@interface ViewControllerHook: UIViewController <MBAutoHook>
@end

@implementation ViewControllerHook

+ (NSArray<NSString *> *)targetClasses {
    return @[@"ViewController"];
}

- (void)hook_viewDidLoad {
    [self orig_viewDidLoad];
    self.view.backgroundColor = [UIColor redColor]
}

// MARK: Placeholder

- (void)orig_viewDidLoad { }

@end

````
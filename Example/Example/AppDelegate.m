//
//  AppDelegate.m
//  Example
//
//  Created by DragonLi on 8/7/2021.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "LFLAccountTool.h"
#import <LFLRouter/LFLRouter.h>

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc]init];
    self.window.rootViewController = [[ViewController alloc]init];
    [self.window makeKeyAndVisible];
    [self testFunction];
    return YES;
}

- (void)testFunction {
    
    /**
     * 实际Scheme中可能为【LFLAccountTool 为具体组件实现类】，但是scheme是account而已，这个不用太关注，后续可以桥接配置组件内实现转化
     */
    
    NSString *testString = @"LFL://usr/openuserinfo?name=lfl&age=DragonLi";
    [[LFLRouter sharedManger] configModuleWithKey:@"openuserinfo" value:@"LFLAccountTool"];
    
    NSLog(@"Router Result %@",[[LFLRouter sharedManger] openURLString:testString]);
}



@end

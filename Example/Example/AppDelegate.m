//
//  AppDelegate.m
//  Example
//
//  Created by DragonLi on 8/7/2021.
//

#import "AppDelegate.h"
#import "ViewController.h"

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
    NSLog(@"%@",[LFLRouter openURLString:@"LFL://usr/openuserinfo/?name=lfl&age=18"]);
}



@end

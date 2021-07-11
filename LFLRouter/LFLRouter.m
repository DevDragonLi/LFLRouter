//
//  LFLRouter.m
//  LFLRouter
//
//  Created by DragonLi on 8/7/2021.

#import "LFLRouter.h"

@implementation LFLRouter

+ (nullable id)openURLString:(nullable NSString *)URLString {
    if (!URLString && ![URLString isKindOfClass:NSString.class]) {
        NSAssert(YES, @"URLString Error");
        return nil;
    } else {
        NSURL *url = [[NSURL alloc]initWithString:URLString];
        NSLog(@"query参数%@",url.query);
        [self parsingURLString:url];
        return @"PlaceString";
    }
}

+ (void)parsingURLString:(nullable NSURL *)URLString {
    
    Class runClass = NSClassFromString(@"LFLAccountTool");
    
    SEL selector = NSSelectorFromString([NSString stringWithFormat:@"testFunctionWithName:headerImage:email:"]);
    
    NSMethodSignature *signature = [runClass methodSignatureForSelector:selector]; //
    if (!signature) {
        NSLog(@"实例函数");
        signature = [runClass instanceMethodSignatureForSelector:selector];
    } else {
        NSLog(@"类函数");
    }
    if (!signature) {
        NSLog(@"不存在执行体");
        return;
    }
    
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
    
    [invocation setSelector:selector];
    [invocation setTarget:runClass];
    
    NSString *name = @"DevDragonLi";
    UIImage *image = [UIImage new];
    NSString *email = @"DragonLi@88.com";
    
    [invocation setArgument:&name atIndex:2];
    [invocation setArgument:&image atIndex:3];
    [invocation setArgument:&email atIndex:4];
    
    [invocation retainArguments];
    
    [invocation invoke];
    
    //    [invocation getReturnValue:nil];
    
}

+ (void)openURLString:(nullable NSString *)URLString
           parameters:(void (^)(void))parameters {
    
}

@end

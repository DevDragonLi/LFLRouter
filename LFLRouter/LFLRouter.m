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
        if (url) {
            return [self parsingURLString:url];
        } else {
            NSAssert(YES, @"不符合URL规范");
            return nil;
        }
    }
}

+ (id)parsingURLString:(nullable NSURL *)URLString {
    NSLog(@"query参数【%@】",URLString.query);
    Class runClass = NSClassFromString(@"LFLAccountTool");
    
    SEL selector = NSSelectorFromString([NSString stringWithFormat:@"testFunctionWithName:headerImage:"]);
    
    NSMethodSignature *signature = [runClass methodSignatureForSelector:selector]; //
    if (!signature) {
        NSLog(@"此URL解析为示实例函数");
        signature = [runClass instanceMethodSignatureForSelector:selector];
    } else {
        NSLog(@"此URL解析为类函数");
    }
    if (!signature) {
        NSAssert(YES, @"不存在执行函数体");
        return nil;
    }
    
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
    
    [invocation setSelector:selector];
    [invocation setTarget:runClass];
    
    NSString *name = @"DevDragonLi";
    UIImage *image = [UIImage new];
    
    
    [invocation setArgument:&name atIndex:2];
    [invocation setArgument:&image atIndex:3];
    
    
//    NSString *email = @"DragonLi@88.com";
//    [invocation setArgument:&email atIndex:4];
    
    [invocation retainArguments];
    
    [invocation invoke];
    
    const char *returnType = [signature methodReturnType];
    
    if (strcmp(returnType, @encode(void)) == 0) {
        
        return nil;
    } else {
        
        id returnValue = nil;
        [invocation getReturnValue:&returnValue];
        return returnValue;
    }
}

+ (void)openURLString:(nullable NSString *)URLString
           parameters:(void (^)(void))parameters {
}

@end

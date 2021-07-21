//
//  LFLAccountTool.m
//  Example
//
//  Created by DragonLi on 9/7/2021.
//

#import "LFLAccountTool.h"

@implementation LFLAccountTool

+ (void)testBlock:(NSString *)name
            block:(void (^)(NSString *test,NSString *test2))block {
    NSLog(@"LFLAccountTool:testBlock本函数执行");
//    NSLog(@"接收的参数打印如下%@==%@",name,block);
    sleep(3);
//    block(@"测试内容1",@"测试内容2");
}

//  name=lfl&age=18
+ (NSString *)name:(NSString *)name
               age:(UIImage *)age {
    NSLog(@"接收的参数打印如下%@==%@",name,age);
    return name;
}

// Test function
+ (NSString *)testFunctionWithName:(NSString *)name
                       headerImage:(UIImage *)headerImage
                             email:(NSString *)email {
    NSLog(@"LFLAccountTool:testFunctionWithName本函数执行");
    NSLog(@"接收的参数打印如下%@==%@==%@",name,headerImage,email);
    return name;
}

+ (void)testFunctionWithName:(NSString *)name
                 headerImage:(UIImage *)headerImage {
    NSLog(@"LFLAccountTool:testFunctionWithName本函数执行");
    NSLog(@"接收的参数打印如下%@==%@",name,headerImage);
}


@end

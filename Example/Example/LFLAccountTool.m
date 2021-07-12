//
//  LFLAccountTool.m
//  Example
//
//  Created by DragonLi on 9/7/2021.
//

#import "LFLAccountTool.h"

@implementation LFLAccountTool

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

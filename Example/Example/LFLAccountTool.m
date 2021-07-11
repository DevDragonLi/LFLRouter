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
    NSLog(@"LFLAccountTool执行了原生函数");
    NSLog(@"%@==%@==%@",name,headerImage,email);
    return name;
}

@end

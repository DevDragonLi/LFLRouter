//
//  LFLRouter.m
//  LFLRouter
//
//  Created by DragonLi on 8/7/2021.
//

#import "LFLRouter.h"

@implementation LFLRouter

+ (nullable id)objectWithURLString:(nullable NSString *)URLString {
    if (!URLString && ![URLString isKindOfClass:NSString.class]) {
        NSAssert(YES, @"URLString Error");
        return nil;
    } else {
        NSLog(@"入参URL%@",URLString);
        return @"PlaceString";
    }
}

@end

//
//  LFLAccountTool.h
//  Example
//
//  Created by DragonLi on 9/7/2021.
//


#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LFLAccountTool : NSObject

/// Test function  Return
+ (NSString *)testFunctionWithName:(NSString *)name
                       headerImage:(UIImage *)headerImage
                             email:(NSString *)email;
/// Test function  void Type 
+ (void)testFunctionWithName:(NSString *)name
                 headerImage:(UIImage *)headerImage;

@end

NS_ASSUME_NONNULL_END

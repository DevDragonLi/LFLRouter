//
//  LFLRouter.h
//  LFLRouter
//
//  Created by DragonLi on 8/7/2021.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LFLRouter : NSObject

/** AnyClass Object Funcation
 *  Example: input a URL ,return AnyClass Object
 */
+ (nullable id)objectWithURLString:(nullable NSString *)URLString;


@end

NS_ASSUME_NONNULL_END

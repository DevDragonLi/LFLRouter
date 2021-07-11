//
//  LFLRouter.h
//  LFLRouter
//
//  Created by DragonLi on 8/7/2021.
//
/**
 scheme://描述/打开方式/保留字段/功能标识？参数1=值1&参数2=值2
 */

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LFLRouter : NSObject

/** AnyClass Object Funcation
 *  Example: input a URL ,return AnyClass Object immediate
 */
+ (nullable id)openURLString:(nullable NSString *)URLString;

/** AnyClass Object Funcation
 *  Example: input a URL ,return AnyClass Object wait result in Block
 */
+ (void)openURLString:(nullable NSString *)URLString
           parameters:(void (^)(void))parameters;

@end

NS_ASSUME_NONNULL_END

//
//  LFLRouter.m
//  LFLRouter
//
//  Created by DragonLi on 8/7/2021.

#import "LFLRouter.h"

@interface LFLRouter ()

@property (nonatomic,strong,nullable) NSMutableDictionary <NSString * , NSString * > * mapDics;

@end

@implementation LFLRouter

+ (instancetype)sharedManger {
    static dispatch_once_t once;
    static LFLRouter *sharedManger;
    dispatch_once(&once, ^{
        sharedManger = [[[self class] alloc] init];
        sharedManger.mapDics = [NSMutableDictionary dictionaryWithCapacity:1024];
    });
    return sharedManger;
}

- (nullable id)openURLString:(nullable NSString *)URLString {
    
    if (!URLString || ![URLString isKindOfClass:NSString.class]) {
        NSAssert(NO, @"openURLString Error,Please Check This Parameter");
        return nil;
    } else {
        NSURL *url = [[NSURL alloc]initWithString:URLString];
        
        if (url && [url isKindOfClass:NSURL.class]) {
            
            return [self parsingURLString:url];
        } else {
            NSAssert(NO, @"Error URL parameter");
            return nil;
        }
    }
}

- (id)exception {
    NSAssert(NO, @"Error URL parameter");
    return nil;
}


- (id)parsingURLString:(nullable NSURL *)URLString {
    
    NSString *absoluteString = URLString.absoluteString;
    if (absoluteString == nil) {
        return [self exception];
    }
    /// 针对不同诉求，此处可自定义调整
    NSString *bussinessClsString = URLString.path.lastPathComponent; //pathComponents;
    NSURLComponents *urlComponents = [[NSURLComponents alloc] initWithString:URLString.absoluteString];
    
    if (!bussinessClsString || !urlComponents.queryItems.count) {
        return [self exception];
    }
    
    if ([self.mapDics objectForKey:bussinessClsString]) {
        bussinessClsString = [self.mapDics objectForKey:bussinessClsString];
    }
    
    NSMutableDictionary *queryParams = [[NSMutableDictionary alloc] init];
    
    __block NSString *selString = [NSString string];
    
    [urlComponents.queryItems enumerateObjectsUsingBlock:^(NSURLQueryItem * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (obj.value && obj.name) {
            [queryParams setObject:obj.value forKey:obj.name];
            if (selString.length == 0) {
                selString = [selString stringByAppendingString:obj.name];
            } else {
                selString = [selString stringByAppendingFormat:@"%@", [NSString stringWithFormat:@":%@",obj.name]];
            }
        }
    }];
    
    selString = [NSString stringWithFormat:@"%@:",selString];
    
    Class runClass = NSClassFromString(bussinessClsString);
    SEL selector = NSSelectorFromString(selString);
    
    if (!runClass || !selector) {
        return [self exception];
    }
    
    NSMethodSignature *signature = [runClass methodSignatureForSelector:selector]; //
    if (!signature) {
        signature = [runClass instanceMethodSignatureForSelector:selector];
    }
    
    if (!signature) {
        NSAssert2(NO, @"%@:%@ UnFound", bussinessClsString, selString);
        return nil;
    }
    
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
    
    [invocation setSelector:selector];
    [invocation setTarget:runClass];
    
    [urlComponents.queryItems enumerateObjectsUsingBlock:^(NSURLQueryItem * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (obj.value && obj.name) {
            id value = obj.value;
            NSInteger index = 2 + idx;
            [invocation setArgument:&value atIndex: index];
        }
    }];
    
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

- (void)openURLString:(nullable NSString *)URLString
           parameters:(void (^)(void))parameters {
    
}


- (void)configModuleWithKey:(nullable NSString *)key
                      value:(nullable NSString *)value {
    
    if (key && value) {
        [self.mapDics setValue:value forKey:key];
    }
}

/**
 * Config ref class
 */
- (void)buildMaps:(nullable NSDictionary *)maps {
    if (maps) {
        [self.mapDics addEntriesFromDictionary:maps];
    }
}


@end

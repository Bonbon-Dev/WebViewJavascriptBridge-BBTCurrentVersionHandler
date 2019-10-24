//
//  WKWebViewJavascriptBridge+BBTCurrentVersionHandler.m
//  WKWebViewJavascriptBridge-BBTCurrentVersionHandler
//
//  Created by 孟昕欣 on 2019/10/24.
//

#import "WKWebViewJavascriptBridge+BBTCurrentVersionHandler.h"
#import <AMKCategories/NSObject+AMKMethodSwizzling.h>

@interface WKWebViewJavascriptBridge (_BBTCurrentVersionHandler)
@property(nonatomic, strong, nullable) NSMutableSet<NSString *> *bbt__registeredHandlers;
@end

@implementation WKWebViewJavascriptBridge (BBTCurrentVersionHandler)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [WKWebViewJavascriptBridge amk_swizzleInstanceMethod:@selector(registerHandler:handler:)
                                                  withMethod:@selector(BBTCurrentVersionHandler_WKWebViewJavascriptBridge_registerHandler:handler:)];
        [WKWebViewJavascriptBridge amk_swizzleInstanceMethod:@selector(removeHandler:)
                                                  withMethod:@selector(BBTCurrentVersionHandler_WKWebViewJavascriptBridge_removeHandler:)];
        [WKWebViewJavascriptBridge amk_swizzleInstanceMethod:@selector(reset)
                                                  withMethod:@selector(BBTCurrentVersionHandler_WKWebViewJavascriptBridge_reset)];
    });
}

#pragma mark - Init Methods

#pragma mark - Properties

- (NSMutableSet<NSString *> *)bbt__registeredHandlers {
    NSMutableSet<NSString *> *registeredHandlers = objc_getAssociatedObject(self, @selector(bbt__registeredHandlers));
    if (!registeredHandlers) {
        registeredHandlers = [NSMutableSet set];
        [self setBbt__registeredHandlers:registeredHandlers];
    }
    return registeredHandlers;
}

- (void)setBbt__registeredHandlers:(NSMutableSet<NSString *> *)registeredHandlers {
    objc_setAssociatedObject(self, @selector(bbt__registeredHandlers), registeredHandlers, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSSet<NSString *> *)bbt_registeredHandlers {
    return self.bbt__registeredHandlers.copy;
}

#pragma mark - Public Methods

- (void)BBTCurrentVersionHandler_WKWebViewJavascriptBridge_registerHandler:(NSString *)handlerName handler:(WVJBHandler)handler {
    if (handlerName && [handlerName isKindOfClass:NSString.class]) [self.bbt__registeredHandlers addObject:handlerName];
    [self BBTCurrentVersionHandler_WKWebViewJavascriptBridge_registerHandler:handlerName handler:handler];
}

- (void)BBTCurrentVersionHandler_WKWebViewJavascriptBridge_removeHandler:(NSString*)handlerName {
    if (handlerName && [handlerName isKindOfClass:NSString.class]) [self.bbt__registeredHandlers removeObject:handlerName];
    [self BBTCurrentVersionHandler_WKWebViewJavascriptBridge_removeHandler:handlerName];
}

- (void)BBTCurrentVersionHandler_WKWebViewJavascriptBridge_reset {
    [self.bbt__registeredHandlers removeAllObjects];
    [self BBTCurrentVersionHandler_WKWebViewJavascriptBridge_reset];
    [self BBTCurrentVersionHandler_WKWebViewJavascriptBridge_registerCurrentVersionHandler];
}

#pragma mark - Private Methods

/// 默认注册 指定Handler
- (void)BBTCurrentVersionHandler_WKWebViewJavascriptBridge_registerCurrentVersionHandler {
    __weak __typeof(self) weakSelf = self;
    [self registerHandler:@"currentVersionHandler" handler:^(id data, WVJBResponseCallback responseCallback) {
        responseCallback(weakSelf.bbt__registeredHandlers.allObjects);
    }];
}

#pragma mark - Notifications

#pragma mark - KVO

#pragma mark - Delegate

#pragma mark - Override

#pragma mark - Networking

#pragma mark - Helper Methods

@end

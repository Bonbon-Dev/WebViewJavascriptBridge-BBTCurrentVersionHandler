//
//  WKWebViewJavascriptBridge+BBTCurrentVersionHandler.h
//  WKWebViewJavascriptBridge-BBTCurrentVersionHandler
//
//  Created by 孟昕欣 on 2019/10/24.
//

#import <WebViewJavascriptBridge/WKWebViewJavascriptBridge.h>


@interface WKWebViewJavascriptBridge (BBTCurrentVersionHandler)
@property(nonatomic, strong, nullable, readonly) NSSet<NSString *> *bbt_registeredHandlers; //!< 已注册的 Handlers
@end

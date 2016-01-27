//
//  AppDelegate.h
//  Note_Alipay
//
//  Created by HuangFei on 16/1/15.
//  Copyright © 2016年 HuangFei. All rights reserved.
//

#import <UIKit/UIKit.h>

//支付宝回调代理方法
@protocol AlipayDelegate <NSObject>

- (void)paymentResultCallbackWithResultDic:(NSDictionary *)resultDic;

@end

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic, weak) id<AlipayDelegate> alipayDelegate;

@end


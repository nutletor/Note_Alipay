//
//  Order.h
//  AlixPayDemo
//
//  Created by 方彬 on 11/2/13.
//
//

#import <Foundation/Foundation.h>

@interface Order : NSObject

/**
 合作身份者ID（以2088开头由16位纯数字组成的字符串）
 */
@property(nonatomic, copy) NSString * partner;

/**
 支付宝收款帐号（手机或邮箱格式）
 */
@property(nonatomic, copy) NSString * seller;

/**
 订单ID
 */
@property(nonatomic, copy) NSString * tradeNO;
@property(nonatomic, copy) NSString * productName;
@property(nonatomic, copy) NSString * productDescription;

/**
 商品价格
 */
@property(nonatomic, copy) NSString * amount;

/**
 回调URL
 */
@property(nonatomic, copy) NSString * notifyURL;

@property(nonatomic, copy) NSString * service;
@property(nonatomic, copy) NSString * paymentType;
@property(nonatomic, copy) NSString * inputCharset;
@property(nonatomic, copy) NSString * itBPay;
@property(nonatomic, copy) NSString * showUrl;


@property(nonatomic, copy) NSString * rsaDate;//可选
@property(nonatomic, copy) NSString * appID;//可选

@property(nonatomic, readonly) NSMutableDictionary * extraParams;


@end

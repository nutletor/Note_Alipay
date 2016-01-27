//
//  ViewController.m
//  Note_Alipay
//
//  Created by HuangFei on 16/1/15.
//  Copyright © 2016年 HuangFei. All rights reserved.
//

#import "ViewController.h"

#import <AlipaySDK/AlipaySDK.h>
#import "AppDelegate.h"

#import "Order.h"

@interface ViewController ()<AlipayDelegate>

- (IBAction)alipayBtnAction:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//跳转支付宝进行支付
- (IBAction)alipayBtnAction:(id)sender {
    
    /*
     服务器端需要处理的部分
     *
     
    //合作者身份ID（2088开头16位纯数字）
    NSString *partner = @"2088xxxxxxxxxxxx";
    //卖家支付宝账号（邮箱或手机号格式）
    NSString *seller = @"xxx@alipay.com";
    //PKCS8格式RSA私钥（需自行生成并上传到支付宝商户平台）
    NSString *privateKey = @"MIICdwIBADANBgkqhkiG9w0BAQEFAASCAmEwggJdAgEAAoGBAMeZqfysF7zKAhTvh3eOu+C6iBz8KtVI+welTvHyTt3keEs7UUaaY28h4HnVe8Wvn7Xu20ZnpUyX3ham0Atc+CtGgPDZxY+RHeeDQMkVp2wIG6g9SRKX5nvUD5MioCCptu+kWaKWRWHY63P7Z+aMMJumW6WpOSComBr5coxHb2+DAgMBAAECgYB5dw+1Dd0cLCp8Jw/fN+MpbRor2WEPjmwFSRnzrqtD6SczUROyzX05Qfpi6gF6WdftVT/nZmd3ZuvmCPmOELOMPVsOrNizuzH7yWw3m1jXVlCs/kfQq8FHY30E+pmIhhl9GVayfXCljqx/a09abjGCn+EtIKkzk0/w+jAwJ/JxEQJBAP19bR00tA8k8FazXjbghWq+ap4XTw2CTBUaYEflg8WBF1lXCwst3lyIvHi9FMUY+ueEaGusIJqWMj/HIiKoV60CQQDJk6Hhah8z1InGBCyLjxph5iyEAuzXwLBZzjuS4otU42RzmtMVoYBiK5pvElvJqQY+38hkI6n5NpS9NJJ+AonvAkAyrVaZFiZBONNLogRd2DkUBAlwnZxSSRBIz8Mb3IihfZNbawlsLLldqoBzaumyFbJjgpcVn43NGeXl1ju+zgTpAkEAhrQMYok7LrSiGNxjNCO+GpvpNZKK2Sbf8jN55g9T0rdeQk69LmBNXc0Ll5vqEJnOHagHzrtyc6KAxOtj1ac2qwJBANaKqbHBm7B4gAjQDoYCdsyjvFc1TKhlsDTtCkWs/xwkoCfZKstuV3Uc5J4BNJDkQOGm38pDRPcUDUh2/jgQaII=";
    
    Order *order = [[Order alloc] init];
    order.partner = partner;
    order.seller = seller;
    order.tradeNO = @""; //订单ID（由商家自行制定）
    order.productName = @""; //商品标题
    order.productDescription = @""; //商品描述
    order.amount = @"0.00"; //商品价格
    order.notifyURL =  @"http://www.xxx.com"; //回调URL（通知服务器端交易结果）
    
    order.service = @"mobile.securitypay.pay";//接口名称（固定值，不可空）
    order.paymentType = @"1";//支付类型（默认值为1：商品购买，不可空）
    order.inputCharset = @"utf-8";//参数编码字符集: 商户网站使用的编码格式（固定为utf-8，不可空）
    order.itBPay = @"30m";//未付款交易的超时时间（取值范围:1m-15d，可空）
    order.showUrl = @"m.alipay.com";
    
    //将商品信息拼接成字符串
    NSString *orderSpec = [order description];
    NSLog(@"orderSpec = %@",orderSpec);
    
    //获取私钥并将商户信息签名,外部商户可以根据情况存放私钥和签名,只需要遵循RSA签名规范,并将签名字符串base64编码和UrlEncode
    id<DataSigner> signer = CreateRSADataSigner(privateKey);
    NSString *signedString = [signer signString:orderSpec];
    
    //将签名成功字符串格式化为订单字符串,请严格按照该格式
    NSString *orderString = nil;
    if (signedString != nil) {
        orderString = [NSString stringWithFormat:@"%@&sign=\"%@\"&sign_type=\"%@\"",
                       orderSpec, signedString, @"RSA"];
    }
     
    */
    
    
    //应用注册scheme,在AlixPayDemo-Info.plist定义URL types
    NSString *appScheme = @"ali2088xxxxxxxxxxxx";//从支付宝客户端返回App所需，保持唯一性
    
    //通过请求服务器获取到，经过服务端处理后的订单信息
    NSString * orderString = @"";
    
    //支付完成回调代理
    AppDelegate * appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    appDelegate.alipayDelegate = self;
    
    [[AlipaySDK defaultService] payOrder:orderString fromScheme:appScheme callback:^(NSDictionary *resultDic) {
        
        [self checkPaymentResultDic:resultDic];
    }];
}

//核实支付结果
- (void)checkPaymentResultDic:(NSDictionary *)resultDic
{
    NSLog(@"reslut = %@",resultDic);
    
    switch ([[resultDic objectForKey:@"resultStatus"] integerValue]) {
        case 9000: {
            //to do 请求服务器验证支付状态
        }
            break;
        default:
            break;
    }
    //9000	订单支付成功
    //8000	正在处理中
    //4000	订单支付失败
    //6001	用户中途取消
    //6002	网络连接出错
}

#pragma mark - AlipayDelegate
- (void)paymentResultCallbackWithResultDic:(NSDictionary *)resultDic
{
    [self checkPaymentResultDic:resultDic];
}

@end

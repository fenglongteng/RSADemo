//
//  ViewController.m
//  RSADemo
//
//  Created by fenglongteng on 16/5/24.
//  Copyright © 2016年 fenglongteng. All rights reserved.
//

#import "ViewController.h"
#import "RSAEncryptor.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //配置秘钥
    RSAEncryptor* rsaEncryptor = [[RSAEncryptor alloc] init];
    NSString* publicKeyPath = [[NSBundle mainBundle] pathForResource:@"public_key" ofType:@"der"];
    NSString* privateKeyPath = [[NSBundle mainBundle] pathForResource:@"private_key" ofType:@"p12"];
    [rsaEncryptor loadPublicKeyFromFile: publicKeyPath];
    [rsaEncryptor loadPrivateKeyFromFile: privateKeyPath password:@"www.57.com"];    // 这里，请换成你生成p12时的密码
    //字符串RSA加密
    NSString *string = @"ios RSA加密";
    NSString* restrinBASE64STRING = [rsaEncryptor rsaEncryptString:string];
    NSLog(@"Encrypted==== %@", restrinBASE64STRING);       // 请把这段字符串Copy到JAVA这边main()里做测试
    //字符串RSA解密
    NSString* decryptString = [rsaEncryptor rsaDecryptString: restrinBASE64STRING];
    NSLog(@"Decrypted==== %@", decryptString);
    
    
    // System.out.println the encrypt string from Java , and paste it here
    // 这里请换成你的JAVA这边产生的加密的Base64 Encode的字符串
            NSString* rsaEncrypyBase64 = [NSString stringWithFormat:@"%@\r%@\r%@",
                                          @"ZNKCVpFYd4Oi2pecLhDXHh+8kWltUMLdBIBDeTvU5kWpTQ8cA1Y+7wKO3d/M8bhULYf1FhWt80Cg",
                                          @"7e73SV5r+wSlgGWBvTIxqgTWFS4ELGzsEJpVVSlK1oXF0N2mugOURUILjeQrwn1QTcVdXXTMQ0wj",
                                          @"50GNwnHbAwyLvsY5EUY="];
    
            NSString* resultString = [rsaEncryptor rsaDecryptString: rsaEncrypyBase64];
            NSLog(@"Decrypt Java RSA String=== %@", resultString);
   //  Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

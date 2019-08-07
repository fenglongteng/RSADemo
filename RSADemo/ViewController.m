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
    NSString* publicKeyPath = [[NSBundle mainBundle] pathForResource:@"perfactpay" ofType:@"cer"];
    NSString* privateKeyPath = [[NSBundle mainBundle] pathForResource:@"perfactpay" ofType:@"pfx"];
    [rsaEncryptor loadPublicKeyFromFile: publicKeyPath];
    [rsaEncryptor loadPrivateKeyFromFile: privateKeyPath password:@"123456"];    // 这里，请换成你生成p12时的密码
    //字符串RSA加密
    NSString *string = @"ios RSA加密";
    for (int i = 0; i<1000; i++) {
       string = [string stringByAppendingString:@"123456"];
    }
    NSLog(@"ENcrypted====%@=====%ld", string,string.length);
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
    NSData* restrinBASE64STRING = [rsaEncryptor rsaEncryptData:data];
   // NSLog(@"Encrypted==== %@", restrinBASE64STRING);       // 请把这段字符串Copy到JAVA这边main()里做测试
    //字符串RSA解密
    NSData* decryptString = [rsaEncryptor rsaDecryptData: restrinBASE64STRING];
    NSString *str = [[NSString alloc]initWithData:decryptString encoding:NSUTF8StringEncoding];
    NSLog(@"Decrypted====%@=====%ld", str,str.length);
    if([string isEqualToString:str]){
        NSLog(@"加密解密前后一致");
    }
    
    
    // System.out.println the encrypt string from Java , and paste it here
    // 这里请换成你的JAVA这边产生的加密的Base64 Encode的字符串
    NSString* rsaEncrypyBase64 = @"5bed55Sw5Zyo5ZOq6YeM5ZWK";
    NSString* resultString = [rsaEncryptor rsaDecryptString: rsaEncrypyBase64];
    NSLog(@"Decrypt Java RSA String=== %@", resultString);
   //  Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

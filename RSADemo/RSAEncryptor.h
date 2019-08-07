//
//  RSAEncryptor.h
//  RSADemo
//
//  Created by fenglongteng on 16/5/24.
//  Copyright © 2016年 fenglongteng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RSAEncryptor : NSObject
#pragma mark - Instance Methods

-(void) loadPublicKeyFromFile: (NSString*) derFilePath;
-(void) loadPublicKeyFromData: (NSData*) derData;

-(void) loadPrivateKeyFromFile: (NSString*) p12FilePath password:(NSString*)p12Password;
-(void) loadPrivateKeyFromData: (NSData*) p12Data password:(NSString*)p12Password;



//公钥加密 私钥解密
-(NSString*) rsaEncryptString:(NSString*)string;
-(NSData*) rsaEncryptData:(NSData*)data ;

-(NSString*) rsaDecryptString:(NSString*)string;
-(NSData*) rsaDecryptData:(NSData*)data;

//openssl 可做 私钥加密 公钥解密 但是一般不建议使用私钥加密
//参考 https://www.jianshu.com/p/d80170efee31


#pragma mark - Class Methods

+(void) setSharedInstance: (RSAEncryptor*)instance;
+(RSAEncryptor*) sharedInstance;
@end

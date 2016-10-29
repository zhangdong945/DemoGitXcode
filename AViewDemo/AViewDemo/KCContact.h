//
//  KCContact.h
//  AViewDemo
//
//  Created by 张东 on 2016/10/23.
//  Copyright © 2016年 zhang dong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KCContact : NSObject

#pragma mark 姓
@property (nonatomic, copy) NSString *firstName;
#pragma mark 名
@property (nonatomic, copy) NSString *lastName;
#pragma mark 电话号码
@property (nonatomic, copy) NSString *phoneNumber;

#pragma mark 带参数构造函数
-(KCContact *)initWithFirstName:(NSString *)aFirstName  andLastName:(NSString *)aLastName andPhoneNumber:(NSString *)aPhoneNumber;

#pragma mark 带参数静态构造函数
+(KCContact *)initWithFirstName:(NSString *)aFirstName  andLastName:(NSString *)aLastName andPhoneNumber:(NSString *)aPhoneNumber;

#pragma mark 取得姓名
-(NSString *)getName;

@end

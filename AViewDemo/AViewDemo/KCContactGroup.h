//
//  KCContactGroup.h
//  AViewDemo
//
//  Created by 张东 on 2016/10/23.
//  Copyright © 2016年 zhang dong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KCContact.h"

@interface KCContactGroup : NSObject

#pragma mark 组名
@property (nonatomic, copy) NSString *name;

#pragma mark 分组描述
@property (nonatomic, copy) NSString *detail;

#pragma mark 联系人
@property (nonatomic, copy) NSMutableArray *contacts;

#pragma mark 带参数构造函数
-(KCContactGroup *)initWithName:(NSString *)aName  andDetail:(NSString *)aDetail and_Contacts:(NSMutableArray *)aContacts;

#pragma mark 带参数静态构造函数
+(KCContactGroup *)initWithName:(NSString *)aName  andDetail:(NSString *)aDetail and_Contacts:(NSMutableArray *)aContacts;

@end

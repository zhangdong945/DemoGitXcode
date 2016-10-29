//
//  ASPerson.h
//  DemoOC
//
//  Created by 张东 on 2016/10/22.
//  Copyright © 2016年 zhang dong. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ASAccount;

@interface ASPerson : NSObject {
    @private
    int _age;
}

#pragma mark - 属性
#pragma mark   姓名
@property (nonatomic, copy) NSString *name;
#pragma mark - 属性
#pragma mark   账户
@property (nonatomic, retain) ASAccount *account;

#pragma mark  公共方法
#pragma mark  显示人员信息
-(void) showMessage;
@end

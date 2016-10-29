//
//  ASPerson.m
//  DemoOC
//
//  Created by 张东 on 2016/10/22.
//  Copyright © 2016年 zhang dong. All rights reserved.
//

#import "ASPerson.h"
#import "ASAccount.h"

@implementation ASPerson 

#pragma mark - 公共方法
#pragma mark   显示人员信息
-(void)showMessage {
    NSLog(@"name=%@, age=%d", _name, _age);
}

#pragma mark   设置人员账号
-(void)setAccount:(ASAccount *)account {
    _account = account;
    [self.account addObserver:self forKeyPath:@"balance" options:NSKeyValueObservingOptionNew context:nil];
}

#pragma mark - 覆盖方法
#pragma mark 重写observeValueForKeyPath方法，当账户余额变化后此处获得通知
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    if([keyPath isEqualToString:@"balance"]){//这里只处理balance属性
        NSLog(@"keyPath=%@,object=%@,newValue=%.2f,context=%@",keyPath,object,[[change objectForKey:@"new"] floatValue],context);
    }
}
#pragma mark 重写销毁方法
-(void)dealloc{
    [self.account removeObserver:self forKeyPath:@"balance"];//移除监听
    //[super dealloc];//注意启用了ARC，此处不需要调用
}@end

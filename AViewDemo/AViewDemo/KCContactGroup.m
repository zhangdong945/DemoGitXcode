//
//  KCContactGroup.m
//  AViewDemo
//
//  Created by 张东 on 2016/10/23.
//  Copyright © 2016年 zhang dong. All rights reserved.
//

#import "KCContactGroup.h"

@implementation KCContactGroup

-(KCContactGroup *)initWithName:(NSString *)aName andDetail:(NSString *)aDetail and_Contacts:(NSMutableArray *)aContacts {
    if (self = [super init]){
        self.name = aName;
        self.detail =aDetail;
        self.contacts = aContacts;
    }
    return self;
}

+(KCContactGroup *)initWithName:(NSString *)aName andDetail:(NSString *)aDetail and_Contacts:(NSMutableArray *)aContacts {
    KCContactGroup *group1 = [[KCContactGroup alloc]initWithName:aName andDetail:aDetail and_Contacts:aContacts];
    return group1;
}

@end

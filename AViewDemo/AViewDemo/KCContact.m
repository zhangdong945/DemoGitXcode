//
//  KCContact.m
//  AViewDemo
//
//  Created by 张东 on 2016/10/23.
//  Copyright © 2016年 zhang dong. All rights reserved.
//

#import "KCContact.h"

@implementation KCContact


-(KCContact *)initWithFirstName:(NSString *)aFirstName andLastName:(NSString *)aLastName andPhoneNumber:(NSString *)aPhoneNumber {
    if (self = [super init]) {
        self.firstName = aFirstName;
        self.lastName = aLastName;
        self.phoneNumber = aPhoneNumber;
    }
    return self;
}

+(KCContact *)initWithFirstName:(NSString *)aFirstName andLastName:(NSString *)aLastName andPhoneNumber:(NSString *)aPhoneNumber {
    KCContact *result =[[KCContact alloc] initWithFirstName:aFirstName andLastName:aLastName andPhoneNumber:aPhoneNumber];
    return result;
}

-(NSString *)getName {
    return [NSString stringWithFormat:@"%@ %@", _firstName, _lastName ];
}

@end

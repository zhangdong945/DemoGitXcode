//
//  Cattle.m
//  DemoOC
//
//  Created by 张东 on 2016/10/14.
//  Copyright © 2016年 zhang dong. All rights reserved.
//

#import "Cattle.h"

@implementation Cattle
-(void)saySomething {
    NSLog(@"Hello, I'm cattle, I have %d legs.", legsCount);
}

-(void)setLegsCount:(int)count
{
    legsCount = count;
}

@end

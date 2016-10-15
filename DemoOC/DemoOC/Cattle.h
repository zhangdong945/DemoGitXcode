//
//  Cattle.h
//  DemoOC
//
//  Created by 张东 on 2016/10/14.
//  Copyright © 2016年 zhang dong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cattle : NSObject {
    int legsCount;
}
-(void)saySomething;
-(void)setLegsCount:(int)count;

@end

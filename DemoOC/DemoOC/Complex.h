//
//  Complex.h
//  DemoOC
//
//  Created by 张东 on 2016/10/15.
//  Copyright © 2016年 zhang dong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Complex : NSObject

@property (nonatomic) double real;
@property (nonatomic) double imag;

-(id) initWithReal: (double)aReal  Imag:(double)aImag;
-(Complex*) add:(Complex*) second;
@end

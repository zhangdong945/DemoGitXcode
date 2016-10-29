//
//  Complex.m
//  DemoOC
//
//  Created by 张东 on 2016/10/15.
//  Copyright © 2016年 zhang dong. All rights reserved.
//

#import "Complex.h"

@implementation Complex

@synthesize real, imag;

-(id) initWithReal:(double)aReal Imag:(double)aImag {
    if (self = [super init]) {
        real = aReal;
        imag = aImag;
    }
    return self;
}

-(Complex*) add:(Complex *)second {
    Complex* result = [[Complex alloc] init];
    result.real = self.real + second.real;
    result.imag = self.imag + second.imag;
    
    return result;
}

- (NSString*)description {
    NSString* clsName = NSStringFromClass([self class]);
    NSLog(@"My Class:%@", clsName);
    
    NSString* str = [NSString stringWithFormat:@"(%g +  %gi)", real, imag];
    return str;
}


@end

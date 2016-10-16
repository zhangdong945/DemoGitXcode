//
//  Rectangle.m
//  DemoOC
//
//  Created by 张东 on 2016/10/15.
//  Copyright © 2016年 zhang dong. All rights reserved.
//

#import "Rectangle.h"

@implementation Rectangle
@synthesize height, width;

//-(void)setHeight:(double)newHeight Width:(double)newWidth{
//    height = newHeight;
//    width = newWidth;
//}
//-(double)height {
//    return height;
//}
//
//
//-(double)width {
//    return width;
//}

-(double)Area{
    return height*width;
}

-(id)init {
    return [self initWithHeight:10. Width:20.];
}

-(id) initWithHeight:(double)aHeight Width:(double)aWidth{
    if (self = [super init]) {
        self.height = aHeight;
        self.width  = aWidth;
    }
    return self;
}
@end

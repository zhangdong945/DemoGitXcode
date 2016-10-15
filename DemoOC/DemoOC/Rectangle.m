//
//  Rectangle.m
//  DemoOC
//
//  Created by 张东 on 2016/10/15.
//  Copyright © 2016年 zhang dong. All rights reserved.
//

#import "Rectangle.h"

@implementation Rectangle

-(void)setHeight:(double)newHeight {
    height = newHeight;
}
-(double)height {
    return height;
}

-(void)setWidth:(double)newWidth{
    width = newWidth;
}
-(double)width {
    return width;
}

-(double)Area{
    return height*width;
}

@end

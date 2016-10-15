//
//  Rectangle.h
//  DemoOC
//
//  Created by 张东 on 2016/10/15.
//  Copyright © 2016年 zhang dong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Rectangle : NSObject  {
@protected
    double height;
    double width;
}

-(void)setHeight:(double)newHeight;
-(double)height;
-(void)setWidth:(double)newWidth;
-(double)width;

-(double)Area;


@end

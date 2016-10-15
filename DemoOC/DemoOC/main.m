//
//  main.m
//  DemoOC
//
//  Created by 张东 on 2016/10/14.
//  Copyright © 2016年 zhang dong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cattle.h"
#import "Rectangle.h"

int main(int argc, const char * argv[]) {
  // using ARC
    @autoreleasepool {
        // insert code here...
        //NSLog(@"Hello, World!");
        Cattle* cattle = [[Cattle alloc] init];
        [cattle setLegsCount:4];
        [cattle saySomething];
        
        Rectangle* myRect = [[Rectangle alloc] init];
        [myRect setHeight:25.2];
        [myRect setWidth:25.0];
        
        NSLog(@"Current rectangle length is %f \n", [myRect height]);
        NSLog(@"Current rectangle width is %f! \n", [myRect width]);
        NSLog(@"Current rectangle area is %f! \n", [myRect Area]);
    
    }
//    NSAutoreleasePool* pool = [[NSAutoreleasePool alloc] init];
//   
//    NSString* name = @"Tom";
//    
//    NSLog(@"My name is %@", name);
//    int age = 20;
//    NSLog(@"My age is %d", age);
//    BOOL isAdult = age>=18?YES:NO;
//    if (isAdult == YES)
//        NSLog(@"I'm an adult!");
//    else
//        NSLog(@"I'm under age!");
//    
//    Cattle *cattle = [[Cattle alloc] init];
//    [cattle setLegsCount:4];
//    [cattle saySomething];
//    
//    [cattle release];
//    
//    [pool drain];
    
    return 0;
}

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
#import "Complex.h"

int main(int argc, const char * argv[]) {
  // using ARC
    @autoreleasepool {
        // insert code here...
        Complex* a = [[Complex alloc] initWithReal:10 Imag:20];
    //    NSLog(@"Result: %g + %gi", a.real, a.imag);
        Complex* b = [[Complex alloc] initWithReal:30 Imag:40];
    //    NSLog(@"Result: %g + %gi", b.real, b.imag);
        
        Complex* c = [a add:b];
        NSLog(@"%@ + %@ = %@\n", a, b, c);
    
        
        //NSLog(@"Hello, World!");
//        Cattle* cattle = [[Cattle alloc] init];
//        [cattle setLegsCount:4];
//        [cattle saySomething];
//        
//        Rectangle* myRect = [[Rectangle alloc] init];
//        NSLog(@"Width: %g Height: %g Area: %g \n", [myRect width], [myRect height],[myRect Area]);
//        
//        myRect.width = 25;
//        myRect.height  = 20;
//        NSLog(@"Width: %g Height: %g Area: %g \n", [myRect width], [myRect height],[myRect Area]);
//        NSLog(@"Current rectangle length is %g \n", [myRect height]);
//        NSLog(@"Current rectangle width is %g \n", [myRect width]);
//        NSLog(@"Current rectangle area is %g \n", [myRect Area]);
    
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

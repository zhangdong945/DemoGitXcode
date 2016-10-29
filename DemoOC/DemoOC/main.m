//
//  main.m
//  DemoOC
//
//  Created by 张东 on 2016/10/14.
//  Copyright © 2016年 zhang dong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import "Cattle.h"
#import "Rectangle.h"
#import "Complex.h"
#import "ASPerson.h"
#import "ASAccount.h"

void sayHello(id self, SEL _cmd, NSString* aHello) {
    NSLog(@"%@", aHello);
}

int main(int argc, const char * argv[]) {
  // using ARC
    @autoreleasepool {
        // insert code here...
        ASPerson *person1 = [[ASPerson alloc] init];
        [person1 setValue:@"Kensin" forKey:@"name"];
        [person1 setValue:@28 forKey:@"age"];
        
        [person1 showMessage];
        //结果：name=Kenshin,age=28
        NSLog(@"person1's name is :%@,age is :%@",person1.name,[person1 valueForKey:@"age"]);
        //结果：person1's name is :Kenshin,age is :28
        
        ASAccount *account1 = [[ASAccount alloc] init];
        person1.account = account1;
        
        [person1 setValue:@1000000.0 forKeyPath:@"account.balance"];
        NSLog(@"person1's balance is :%.2f",[[person1 valueForKeyPath:@"account.balance"] floatValue]);
        //结果：person1's balance is :100000000.00
        
        account1.balance = 3000.;
        
        account1.balance = 5000000.;
        
        
//        Class parentClass = [NSObject class];
//        Class newClass = objc_allocateClassPair(parentClass, "ASDynClass", 0);
//        class_addMethod(newClass, @selector(sayHello:), (IMP)sayHello, "v@:@");
//        objc_registerClassPair(newClass);
//        
//        id p = [[newClass alloc] init];
//        if ( [p respondsToSelector:@selector(sayHello:)] == YES) {
//            [p performSelector:@selector(sayHello:) withObject:@"动态测试：Hello world!"];
//        }
//        
        
//        Complex* a = [[Complex alloc] initWithReal:10 Imag:20];
//    //    NSLog(@"Result: %g + %gi", a.real, a.imag);
//        Complex* b = [[Complex alloc] initWithReal:30 Imag:40];
//    //    NSLog(@"Result: %g + %gi", b.real, b.imag);
//        
//        Complex* c = [a add:b];
//        NSLog(@"%@ + %@ = %@\n", a, b, c);
//    
//        SEL act = @selector(description);
//        //SEL act = @selector(add:);
//        //SEL sct = NSSelectorFromString(@"description");
//        const char* sn  = sel_getName(act);
//        IMP p = [a methodForSelector:act];
//        
//        //c = p(a, act, b);
//        p(a, act);
//        //NSLog(@"IMP: %@ + %@ = %@\n", a, b, c);
//        
//        NSLog(@"%s", sn);
        
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

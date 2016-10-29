//
//  AppDelegate.h
//  AViewDemo
//
//  Created by 张东 on 2016/10/22.
//  Copyright © 2016年 zhang dong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end


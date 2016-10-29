//
//  HomeViewController.m
//  DemoSQLite
//
//  Created by 张东 on 2016/10/29.
//  Copyright © 2016年 zhang dong. All rights reserved.
//

#import "HomeViewController.h"
#import "AddViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController
@synthesize idTextField;
@synthesize nameLabel;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self createDatabase];
}

- (void)createDatabase
{
    //获取数据库文件路径
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *thePath = [paths objectAtIndex:0];
    NSString *file = [thePath stringByAppendingPathComponent:kDatabaseName];
    
    //创建数据库
    
    if (sqlite3_open([file UTF8String], &database) != SQLITE_OK)
    {
        sqlite3_close(database);
        NSAssert(0, @"未能打开数据库");
    }
    
    //创建表
    char *errmsg;
    NSString *createTableSQL = @"CREATE TABLE IF NOT EXISTS STUDENT(ID INTEGER PRIMARY KEY, NAME TEXT);";
    if (sqlite3_exec(database, [createTableSQL UTF8String], nil, nil, &errmsg) != SQLITE_OK)
    {
        sqlite3_close(database);
        NSAssert1(0, @"未能创建表：%s", errmsg);
        sqlite3_free(errmsg);
    }
}

- (IBAction)searchAction:(id)sender
{
    [idTextField resignFirstResponder];
    BOOL notFound = YES;
    
    NSString *selectSQL = [[NSString alloc] initWithFormat:@"SELECT ID, NAME FROM STUDENT WHERE ID = %@", idTextField.text];
    
    sqlite3_stmt *statement;
    
    if (sqlite3_prepare(database, [selectSQL UTF8String], -1, &statement, nil) == SQLITE_OK)
    {
        while (sqlite3_step(statement) == SQLITE_ROW)
        {
            notFound = NO;
            char *name = (char *)sqlite3_column_text(statement, 1);
            nameLabel.text = [NSString stringWithFormat:@"%s", name];
        }
    }
    
    sqlite3_finalize(statement);
    
    if (notFound)
    {
        nameLabel.text = @"没有记录";
    }
    
 //   [selectSQL release];
}

- (IBAction)addAction:(id)sender
{
//    AddViewController *addViewController = [[AddViewController alloc] init];
//    [self presentViewController:addViewController animated:YES completion:nil];
////    [addViewController release];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

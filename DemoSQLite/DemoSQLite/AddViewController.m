//
//  AddViewController.m
//  DemoSQLite
//
//  Created by 张东 on 2016/10/29.
//  Copyright © 2016年 zhang dong. All rights reserved.
//

#import "AddViewController.h"

@interface AddViewController ()

@end




@implementation AddViewController
@synthesize idTextField;
@synthesize nameTextField;
@synthesize saveButton;
@synthesize cancelButton;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)saveInfoIntoDatabase
{
    //打开数据库，获得数据库文件
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *thePath = [paths objectAtIndex:0];
    NSString *file = [thePath stringByAppendingPathComponent:kDatabaseName];
    if (sqlite3_open([file UTF8String], &database) != SQLITE_OK)
    {
        sqlite3_close(database);
        NSAssert(0, @"未能打开数据库");
    }
    
    NSString *insertSQL = [[NSString alloc] initWithFormat:@"INSERT OR REPLACE INTO STUDENT(ID, NAME) VALUES(%@, '%@');", idTextField.text, nameTextField.text];
    char *errmsg;
    if (sqlite3_exec(database, [insertSQL UTF8String], nil, nil, &errmsg) != SQLITE_OK)
    {
        NSAssert1(0, @"未能插入值：%s", errmsg);
        sqlite3_free(errmsg);
    }
    
//    [insertSQL release];
    
    sqlite3_close(database);
    
}

- (BOOL)checkInfo
{
    if ([idTextField.text isEqual:@""] || [nameTextField.text isEqualToString:@""])
    {
        return  NO;
    }
    return YES;
}

- (IBAction)saveAction:(id)sender
{
    NSLog(@"检查信息：%d", [self checkInfo]);
    //保存
    if (![self checkInfo])
    {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"" message:@"请输入信息" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {}];
        
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
   //      [alert release];
    }
    else
    {
        //将信息保存到数据库
        [self saveInfoIntoDatabase];
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

- (IBAction)cancelAction:(id)sender
{
    //取消，重置
    [idTextField setText:@""];
    [nameTextField setText:@""];
    [idTextField resignFirstResponder];
    [nameTextField resignFirstResponder];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField == idTextField)
    {
        [textField resignFirstResponder];
        [nameTextField becomeFirstResponder];
    }
    else
    {
        [textField resignFirstResponder];
    }
    return YES;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

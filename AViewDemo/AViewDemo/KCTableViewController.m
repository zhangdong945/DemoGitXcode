//
//  KCTableViewController.m
//  AViewDemo
//
//  Created by 张东 on 2016/10/23.
//  Copyright © 2016年 zhang dong. All rights reserved.
//

#import "KCTableViewController.h"
#import "KCContact.h"
#import "KCContactGroup.h"

@interface KCTableViewController ()<UITableViewDataSource> {
    UITableView *_tableView;
    NSMutableArray *_contacts;

}
@end

@implementation KCTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 初始化数据
    [self initData];
    
    //创建分组样式的tableview
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 50, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStyleGrouped];
    
    // 设置数据源
    _tableView.dataSource = self;
    
    [self.view addSubview:_tableView];
}
- (IBAction)btnBackTouchUp:(id)sender {
    NSLog(@"从TableView演示窗口返回");
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark 加载数据
- (void)initData{
    _contacts=[[NSMutableArray alloc]init];
    
    KCContact *contact1 = [KCContact initWithFirstName:@"卞" andLastName:@"华政" andPhoneNumber:@"+86 183-5278-0458"];
    KCContact *contact2 = [KCContact initWithFirstName:@"别" andLastName:@"弘一" andPhoneNumber:@"+86 130-5605-7098"];
    KCContactGroup *group1 = [KCContactGroup initWithName:@"Z" andDetail:@"With name begining with B" and_Contacts:[NSMutableArray arrayWithObjects:contact1,contact2, nil]];
    [_contacts addObject:group1];
    
    KCContact *contact3 = [KCContact initWithFirstName:@"蔡" andLastName:@"强" andPhoneNumber:@"+86 137-7527-7175"];
    KCContact *contact4 = [KCContact initWithFirstName:@"蔡" andLastName:@"胜雷" andPhoneNumber:@"+86 139-1508-2430"];
    KCContact *contact5 = [KCContact initWithFirstName:@"蔡" andLastName:@"鹏飞" andPhoneNumber:@"+86 139-2109-3913"];
    KCContactGroup *group2 = [KCContactGroup initWithName:@"C" andDetail:@"With name begining with C" and_Contacts:[NSMutableArray arrayWithObjects:contact3,contact4,contact5, nil]];
    [_contacts addObject:group2];
    
    KCContact *contact6 = [KCContact initWithFirstName:@"戴" andLastName:@"季荣" andPhoneNumber:@"+86 180-0527-0218"];
    KCContact *contact7 = [KCContact initWithFirstName:@"邓" andLastName:@"波" andPhoneNumber:@"+86 138-0920-6006"];
    KCContactGroup *group3 = [KCContactGroup initWithName:@"D" andDetail:@"With name begining with D" and_Contacts:[NSMutableArray arrayWithObjects:contact6,contact7, nil]];
    [_contacts addObject:group3];

    KCContact *contact8 = [KCContact initWithFirstName:@"潘" andLastName:@"树绵" andPhoneNumber:@"+86 139-2274-0397"];
    KCContact *contact9 = [KCContact initWithFirstName:@"潘" andLastName:@"华鑫" andPhoneNumber:@"+86 138-6108-3079"];
    KCContact *contact10 = [KCContact initWithFirstName:@"潘" andLastName:@"小刚" andPhoneNumber:@"+86 139-15098246"];
    KCContact *contact11 = [KCContact initWithFirstName:@"裴" andLastName:@"云杰" andPhoneNumber:@"+86 139-1234-0906"];
    KCContact *contact12 = [KCContact initWithFirstName:@"彭" andLastName:@"海波" andPhoneNumber:@"+86 137-5511-5978"];
    KCContactGroup *group4 = [KCContactGroup initWithName:@"P" andDetail:@"With name begining with P" and_Contacts:[NSMutableArray arrayWithObjects:contact8,contact9,contact10,contact11,contact12, nil]];
    [_contacts addObject:group4];

    KCContact *contact13 = [KCContact initWithFirstName:@"汪" andLastName:@"云亮" andPhoneNumber:@"+86 138-1501-6395"];
    KCContact *contact14 = [KCContact initWithFirstName:@"王" andLastName:@"崇科" andPhoneNumber:@"+86 186-0112-9845"];
    KCContact *contact15 = [KCContact initWithFirstName:@"王" andLastName:@"九方" andPhoneNumber:@"+86 158-5199-0108"];
    KCContactGroup *group5=[KCContactGroup initWithName:@"W" andDetail:@"With names beging with W" and_Contacts:[NSMutableArray arrayWithObjects:contact13,contact14,contact15, nil]];
    [_contacts addObject:group5];

}

#pragma mark - 数据源方法
#pragma mark 返回分组数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    NSLog(@"计算分组数");
    return _contacts.count;
}

#pragma mark 返回每组行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSLog(@"计算每组（组%li)行数", (long)section);
    KCContactGroup *group1 = _contacts[section];
    return group1.contacts.count;
}

#pragma mark 返回每行的单元格
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //NSIndexPath是一个结构体，记录了组合行信息
    NSLog(@"生成单元格（组：%li, 行%li", indexPath.section, indexPath.row);
    KCContactGroup *group = _contacts[indexPath.section];
    KCContact *contact = group.contacts[indexPath.row];
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
    cell.textLabel.text = [contact getName];
    cell.detailTextLabel.text = contact.phoneNumber;
    return cell;
}

#pragma mark 返回每组头标题名称
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    NSLog(@"生成组（组%li) 名称", section);
    KCContactGroup *group = _contacts[section];
    return group.name;
}

#pragma mark 返回每组尾部说明
-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    NSLog(@"生成尾部 （组%li) 详情", section);
    KCContactGroup *group=_contacts[section];
    return group.detail;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

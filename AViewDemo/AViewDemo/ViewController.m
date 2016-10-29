//
//  ViewController.m
//  AViewDemo
//
//  Created by 张东 on 2016/10/22.
//  Copyright © 2016年 zhang dong. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imgView1;

- (IBAction)btnRotateTouchedUp:(UIButton *)sender;
- (IBAction)btnScaleTouchedUp:(UIButton *)sender;
- (IBAction)btnMoveTouchedUp:(UIButton *)sender;
@end

@implementation ViewController

typedef void(^ ButtonHandle)();
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    bScaled = false;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark 图片旋转
- (IBAction)btnRotateTouchedUp:(UIButton *)sender {
//    [UIView animateWithDuration:0.5 animations:^{
//        CGFloat angle = M_PI_2;
//        self.imgView1.transform = CGAffineTransformRotate(self.imgView1.transform, angle);
//    }];

    [self animation:^{
        CGFloat angle = M_PI_2;
        self.imgView1.transform = CGAffineTransformRotate(self.imgView1.transform, angle);
    }];
}

#pragma mark 图片缩放
- (IBAction)btnScaleTouchedUp:(UIButton *)sender {
    CGFloat scale = 0.5;
    if (bScaled) {
        scale = 2;
    }
    self.imgView1.transform = CGAffineTransformScale(self.imgView1.transform, scale, scale);
    bScaled = !bScaled;
}

#pragma mark 图片移动
- (IBAction)btnMoveTouchedUp:(UIButton *)sender {
    CGFloat translateY = 50;
    self.imgView1.transform = CGAffineTransformTranslate(self.imgView1.transform, 0, translateY);
}

#pragma mark 动画执行方法，注意这里可以使用UIView的animateWithDuration方法代替这里只是为了演示
-(void)animation:(ButtonHandle)handle{
    //开始动画
    [UIView beginAnimations:@"animation" context:nil];
    //设置动画执行时间
    [UIView setAnimationDuration:0.5];
    
    handle();
    
    //执行动画操作
    [UIView commitAnimations];
    
}
@end

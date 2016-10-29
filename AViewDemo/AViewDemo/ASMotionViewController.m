//
//  ASMotionViewController.m
//  AViewDemo
//
//  Created by 张东 on 2016/10/23.
//  Copyright © 2016年 zhang dong. All rights reserved.
//

#import "ASMotionViewController.h"

#define SCREEN_WIDTH 320
#define SCREEN_HEIGHT 568
#define IMAGEVIEW_COUNT 3

@interface ASMotionViewController ()<UIScrollViewDelegate>


@end

@implementation ASMotionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // 加载数据
    [self loadImageData];
    [self addScrollView];
    [self addImages];
    [self addPageControl];
    [self addLabel];
    [self setDefaultImage];
}

-(void)loadImageData{
    //读取程序包路径中的资源文件
    NSString *path=[[NSBundle mainBundle] pathForResource:@"imageInfo" ofType:@"plist"];
    _imageData=[NSMutableDictionary dictionaryWithContentsOfFile:path];
    _imageCount=(int)_imageData.count;
}

-(void)addScrollView{
    self.scrollView.frame = [UIScreen mainScreen].bounds;
    
    self.scrollView.delegate = self;
    self.scrollView.contentSize = CGSizeMake(IMAGEVIEW_COUNT*SCREEN_WIDTH, SCREEN_HEIGHT);
    // 设置当前显示位置为中间图片
    [self.scrollView setContentOffset:CGPointMake(SCREEN_WIDTH, 0) animated:NO];
    // 设置分页
    self.scrollView.pagingEnabled = YES;
    
    // 去掉滚动条
    //self.scrollView.showsHorizontalScrollIndicator=NO;
}

-(void)addImages{
    self.leftImageView.frame = CGRectMake(0,0, SCREEN_WIDTH, SCREEN_HEIGHT);
    self.leftImageView.contentMode = UIViewContentModeScaleAspectFit;
    self.centerImageView.frame = CGRectMake(SCREEN_WIDTH,0, SCREEN_WIDTH, SCREEN_HEIGHT);
    self.centerImageView.contentMode = UIViewContentModeScaleAspectFit;
    self.rightImageView.frame = CGRectMake(SCREEN_WIDTH*2,0, SCREEN_WIDTH, SCREEN_HEIGHT);
    self.rightImageView.contentMode = UIViewContentModeScaleAspectFit;
    
}

-(void)setDefaultImage{
    //加载默认图片
    self.leftImageView.image=[UIImage imageNamed:[NSString stringWithFormat:@"%i.jpg",_imageCount-1]];
    NSLog(@"%i.jpg",_imageCount-1);
    self.centerImageView.image=[UIImage imageNamed:[NSString stringWithFormat:@"%i.jpg",0]];
    NSLog(@"%i.jpg",0);
    self.rightImageView.image=[UIImage imageNamed:[NSString stringWithFormat:@"%i.jpg",1]];
    NSLog(@"%i.jpg",1);
    _currentImageIndex=0;
    //设置当前页
    self.pageControl.currentPage=_currentImageIndex;
    NSString *imageName=[NSString stringWithFormat:@"%i.jpg",_currentImageIndex];
    self.label.text=_imageData[imageName];
}

-(void)addPageControl{
    CGSize size = [self.pageControl sizeForNumberOfPages:_imageCount];
    self.pageControl.bounds = CGRectMake(0, 0, size.width, size.height);
    self.pageControl.center = CGPointMake(SCREEN_WIDTH/2, SCREEN_HEIGHT-20);
    self.pageControl.pageIndicatorTintColor = [UIColor colorWithRed:193/255.0 green:219/255.0 blue:249/255.0 alpha:1];
    self.pageControl.currentPageIndicatorTintColor = [UIColor colorWithRed:0 green:150/255.0 blue:1 alpha:1];
    self.pageControl.numberOfPages = _imageCount;
    
}

-(void)addLabel{
    self.label.frame = CGRectMake(0, 25, SCREEN_WIDTH,30);
    self.label.textAlignment=NSTextAlignmentCenter;
    self.label.textColor=[UIColor colorWithRed:0 green:150/255.0 blue:1 alpha:1];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)btnBackTouchUp:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark 滚动停止事件
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    //重新加载图片
    [self reloadImage];
    //移动到中间
    [self.scrollView setContentOffset:CGPointMake(SCREEN_WIDTH, 0) animated:NO];
    //设置分页
    self.pageControl.currentPage=_currentImageIndex;
    //设置描述
    NSString *imageName=[NSString stringWithFormat:@"%i.jpg",_currentImageIndex];
    self.label.text=_imageData[imageName];
}

#pragma mark 重新加载图片
-(void)reloadImage{
    int leftImageIndex,rightImageIndex;
    CGPoint offset=[self.scrollView contentOffset];
    if (offset.x>SCREEN_WIDTH) { //向右滑动
        _currentImageIndex=(_currentImageIndex+1)%_imageCount;
    }else if(offset.x<SCREEN_WIDTH){ //向左滑动
        _currentImageIndex=(_currentImageIndex+_imageCount-1)%_imageCount;
    }
    //UIImageView *centerImageView=(UIImageView *)[_scrollView viewWithTag:2];
    self.centerImageView.image=[UIImage imageNamed:[NSString stringWithFormat:@"%i.jpg",_currentImageIndex]];
    
    //重新设置左右图片
    leftImageIndex=(_currentImageIndex+_imageCount-1)%_imageCount;
    rightImageIndex=(_currentImageIndex+1)%_imageCount;
    self.leftImageView.image=[UIImage imageNamed:[NSString stringWithFormat:@"%i.jpg",leftImageIndex]];
    self.rightImageView.image=[UIImage imageNamed:[NSString stringWithFormat:@"%i.jpg",rightImageIndex]];
}

@end

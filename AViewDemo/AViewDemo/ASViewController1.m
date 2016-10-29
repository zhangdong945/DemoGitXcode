//
//  ASViewController1.m
//  AViewDemo
//
//  Created by 张东 on 2016/10/23.
//  Copyright © 2016年 zhang dong. All rights reserved.
//

#import "ASViewController1.h"

@interface ASViewController1 ()
@property (weak, nonatomic) IBOutlet UIImageView *imgView1;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView1;

@end

@implementation ASViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.scrollView1.contentSize = self.imgView1.frame.size;
    
    //实现缩放：maxinumZoomScale必须大于minimumZoomScale同时实现viewForZoomingInScrollView方法
    self.scrollView1.minimumZoomScale=0.1;
    self.scrollView1.maximumZoomScale=3.0;
    //设置代理
    self.scrollView1.delegate=self;
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

#pragma mark 实现缩放视图代理方法，不实现此方法无法缩放
-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return self.imgView1;
}
-(void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
    NSLog(@"scrollViewWillBeginDecelerating");
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSLog(@"scrollViewDidEndDecelerating");
}
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    NSLog(@"scrollViewWillBeginDragging");
}
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    NSLog(@"scrollViewDidEndDragging");
}
-(void)scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(UIView *)view{
    NSLog(@"scrollViewWillBeginZooming");
}
-(void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale{
    NSLog(@"scrollViewDidEndZooming");
}
//-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
//    NSLog(@"scrollViewDidScroll");
//}


#pragma mark 当图片小于屏幕宽高时缩放后让图片显示到屏幕中间
-(void)scrollViewDidZoom:(UIScrollView *)scrollView{
    CGSize originalSize= self.scrollView1.bounds.size;
    CGSize contentSize= self.scrollView1.contentSize;
    CGFloat offsetX= originalSize.width>contentSize.width?(originalSize.width-contentSize.width)/2:0;
    CGFloat offsetY=originalSize.height>contentSize.height?(originalSize.height-contentSize.height)/2:0;
    
    self.imgView1.center=CGPointMake(contentSize.width/2+offsetX, contentSize.height/2+offsetY);
}

@end

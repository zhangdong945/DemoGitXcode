//
//  ASMotionViewController.h
//  AViewDemo
//
//  Created by 张东 on 2016/10/23.
//  Copyright © 2016年 zhang dong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ASMotionViewController : UIViewController {
    NSMutableDictionary *_imageData; //图片数据
    int _currentImageIndex;
    int _imageCount;
}

@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property (weak, nonatomic) IBOutlet UIImageView *leftImageView;
@property (weak, nonatomic) IBOutlet UIImageView *centerImageView;
@property (weak, nonatomic) IBOutlet UIImageView *rightImageView;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

-(void)loadImageData;
-(void)addScrollView;
-(void)addImages;
-(void)addPageControl;
-(void)addLabel;
-(void)setDefaultImage;
@end

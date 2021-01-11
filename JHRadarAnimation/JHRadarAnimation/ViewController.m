//
//  ViewController.m
//  JHRadarAnimation
//
//  Created by HaoCold on 2020/8/19.
//  Copyright © 2020 HaoCold. All rights reserved.
//

#import "ViewController.h"
#import "UIView+JHRadarAnimation.h"

@interface ViewController ()
@property (nonatomic,  strong) UIImageView *imageView;
@property (nonatomic,  assign) BOOL  flag;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.frame = CGRectMake(0, 0, 60, 60);
    imageView.image = [UIImage imageNamed:@"ring"];
    //imageView.backgroundColor = [UIColor lightGrayColor];
    imageView.center = self.view.center;
    [self.view addSubview:imageView];
    _imageView = imageView;
    
    imageView.jh_radarAnimation.zoomRatio = 2.5;
    imageView.jh_radarAnimation.instanceCount = 3;
    imageView.jh_radarAnimation.instanceDelay = 0.3;
    imageView.jh_radarAnimation.color = [UIColor cyanColor];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    _flag = !_flag;
    
    if (_flag) {
        [_imageView.jh_radarAnimation startAnimation];
    }else{
        [_imageView.jh_radarAnimation stopAnimation];
    }
}


@end

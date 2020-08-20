//
//  JHRadarAnimation.m
//  JHRadarAnimation
//
//  Created by HaoCold on 2020/8/20.
//  Copyright © 2020 HaoCold. All rights reserved.
//
//  MIT License
//
//  Copyright (c) 2020 xjh093
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

#import "JHRadarAnimation.h"

#define kJHRadarAnimationKey @"kJHRadarAnimationKey"

@interface JHRadarAnimation()
@property (nonatomic,    weak) UIView *view;
@property (nonatomic,  strong) CAReplicatorLayer *replayer;
@property (nonatomic,  strong) CAAnimationGroup *animationGroup;
@property (nonatomic,  assign) BOOL  setup;
@end

@implementation JHRadarAnimation

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setupAll];
    }
    return self;
}

- (void)setupAll
{
    _duration = 1.0;
    _instanceCount = 2.0;
    _instanceDelay = _duration / _instanceCount;
    _zoomRatio = 1.5;
    _opacity = 0.5;
    _color = [UIColor orangeColor];
    
    _replayer = [CAReplicatorLayer layer];
}

- (void)startAnimation
{    
    if (!_setup) {
        _setup = YES;
        
        [self setupAnimation];
    }
    
    id animation = [_replayer.sublayers[0] animationForKey:kJHRadarAnimationKey];
    NSLog(@"animation:%@",animation);
    if (!animation) {
        [_replayer.sublayers[0] addAnimation:_animationGroup forKey:kJHRadarAnimationKey];
    }
    
    _replayer.speed = 1;
}

- (void)setupAnimation
{
    NSAssert(_view.superview != nil, @"JHRadarAnimation setupAnimation: _view.superview is nil.");
    
    // Zoom
    CABasicAnimation *scaleAnimation = [CABasicAnimation animation];
    scaleAnimation.keyPath = @"transform.scale";
    scaleAnimation.fromValue = @(1);
    scaleAnimation.toValue = @(_zoomRatio);
    scaleAnimation.fillMode = kCAFillModeForwards;
    
    // Opacity
    CABasicAnimation *opacityAnimation = [CABasicAnimation animation];
    opacityAnimation.keyPath = @"opacity";
    opacityAnimation.fromValue = @(_opacity);
    opacityAnimation.toValue = @(0);
    opacityAnimation.fillMode = kCAFillModeForwards;
    
    // Group
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.animations = @[scaleAnimation,opacityAnimation];
    group.duration = _duration;
    group.repeatCount = MAXFLOAT;
    group.removedOnCompletion = NO;
    _animationGroup = group;
    
    // Layer
    CGFloat W = MIN(CGRectGetWidth(_view.frame), CGRectGetHeight(_view.frame));
    CALayer *layer = [CALayer layer];
    layer.frame = CGRectMake(CGRectGetMinX(_view.frame), CGRectGetMinY(_view.frame), W, W);
    layer.cornerRadius = W*0.5;
    layer.masksToBounds = YES;
    layer.backgroundColor = _color.CGColor;
    [layer addAnimation:group forKey:kJHRadarAnimationKey];
    
    // replayer
    _replayer = [CAReplicatorLayer layer];
    _replayer.instanceCount = _instanceCount;
    _replayer.instanceDelay = _instanceDelay;
    [_replayer addSublayer:layer];
    
    //
    if (_view.superview) {
        [_view.superview.layer addSublayer:_replayer];
        [_view.superview.layer insertSublayer:_replayer below:_view.layer];
    }
}

- (void)stopAnimation
{
    _replayer.speed = 0;
}

- (void)reset
{
    _setup = NO;
    [_replayer removeFromSuperlayer];
    _replayer = nil;
    
    [self setup];
}

- (void)setZoomRatio:(CGFloat)zoomRatio{
    if (zoomRatio <= 1.0) {
        zoomRatio = 1.5;
    }
    _zoomRatio = zoomRatio;
}

- (void)setOpacity:(CGFloat)opacity{
    if (opacity <= 0) {
        opacity = 0.5;
    }
    _opacity = opacity;
}


@end

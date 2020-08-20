//
//  JHRadarAnimation.h
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

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface JHRadarAnimation : NSObject

/// Default is 1.
@property (nonatomic,  assign) CFTimeInterval  duration;

/// Default is 2.
@property (nonatomic,  assign) NSInteger  instanceCount;

/// Default is duration/instanceCount.
@property (nonatomic,  assign) CFTimeInterval  instanceDelay;

/// Default is 1.5. should great then 1.
@property (nonatomic,  assign) CGFloat  zoomRatio;

/// Default is 0.5.
@property (nonatomic,  assign) CGFloat  opacity;

/// Default is [UIColor orangeColor].
@property (nonatomic,  strong) UIColor *color;

///
- (void)startAnimation;

///
- (void)stopAnimation;

///
- (void)reset;

@end

NS_ASSUME_NONNULL_END

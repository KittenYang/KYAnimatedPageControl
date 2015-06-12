//
//  Indicator.h
//  KYAnimatedPageControl-Demo
//
//  所有Indicator的基类
//
//  Created by Kitten Yang on 6/12/15.
//  Copyright (c) 2015 Kitten Yang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@class KYAnimatedPageControl;
@interface Indicator : CALayer

@property(nonatomic,assign)CGFloat indicatorSize;


-(void)animateIndicatorWithScrollView:(UIScrollView *)scrollView andIndicator:(KYAnimatedPageControl *)pgctl;


@end

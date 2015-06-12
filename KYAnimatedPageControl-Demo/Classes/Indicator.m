//
//  Indicator.m
//  KYAnimatedPageControl-Demo
//
//  Created by Kitten Yang on 6/12/15.
//  Copyright (c) 2015 Kitten Yang. All rights reserved.
//

#import "Indicator.h"
#import "KYAnimatedPageControl.h"

@interface Indicator()

@property (nonatomic, strong) id colorObserveToken;

@end

@implementation Indicator


-(void)setIndicatorSize:(CGFloat)indicatorSize{
    if (_indicatorSize != indicatorSize) {
        _indicatorSize = indicatorSize;
    }
}

@end

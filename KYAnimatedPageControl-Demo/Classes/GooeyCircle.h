//
//  GooeyCircle.h
//  KYAnimatedPageControl-Demo
//
//  Created by Kitten Yang on 6/11/15.
//  Copyright (c) 2015 Kitten Yang. All rights reserved.
//

typedef enum ScrollDirection {
    ScrollDirectionNone,
    ScrollDirectionRight,
    ScrollDirectionLeft,
    ScrollDirectionUp,
    ScrollDirectionDown,
    ScrollDirectionCrazy,
} ScrollDirection;

#import <QuartzCore/QuartzCore.h>
#import "Indicator.h"

@interface GooeyCircle : Indicator

@property(nonatomic,assign)CGFloat factor;
@property(nonatomic,assign)ScrollDirection scrollDirection;


@end

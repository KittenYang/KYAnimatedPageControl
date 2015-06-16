//
//  KYAnimatedPageControl.m
//  KYAnimatedPageControl-Demo
//
//  Created by Kitten Yang on 6/10/15.
//  Copyright (c) 2015 Kitten Yang. All rights reserved.
//


#import "KYAnimatedPageControl.h"
#import "GooeyCircle.h"
#import "RotateRect.h"


@interface KYAnimatedPageControl()

@property(nonatomic,strong)Line *line;
//Indicator-STYLE
@property(nonatomic,strong)GooeyCircle *gooeyCircle;
@property(nonatomic,strong)RotateRect  *rotateRect;


@property (nonatomic) NSInteger lastIndex;

@end

@implementation KYAnimatedPageControl

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
        [self addGestureRecognizer:tap];
        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panAction:)];
        [self addGestureRecognizer:pan];

    }
    return self;
}


#pragma mark -- PUBLIC Method
-(void)display{
    
    self.line = [Line layer];
    self.line.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    self.line.pageCount = self.pageCount;
    self.line.selectedPage = 1;
    self.line.shouldShowProgressLine = self.shouldShowProgressLine;
    self.line.unSelectedColor = self.unSelectedColor;
    self.line.selectedColor = self.selectedColor;
    self.line.bindScrollView = self.bindScrollView;
    
    self.line.contentsScale = [UIScreen mainScreen].scale;
    [self.line setNeedsDisplay];
    [self.layer addSublayer:self.line];
    [self addIndicator];
    
    
}

-(Line *)pageControlLine{
    return self.line;
}


#pragma mark -- PRIVATE Method

-(void)addIndicator{
    switch (self.indicatorStyle) {
            
        case IndicatorStyleGooeyCircle:
            
            self.gooeyCircle = [GooeyCircle layer];
            self.indicator = self.gooeyCircle;
            self.gooeyCircle.indicatorColor = self.selectedColor;
            
            self.gooeyCircle.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
            self.gooeyCircle.indicatorSize  = self.indicatorSize;
            self.gooeyCircle.contentsScale = [UIScreen mainScreen].scale;
            [self.gooeyCircle animateIndicatorWithScrollView:self.bindScrollView andIndicator:self];
            [self.layer insertSublayer:self.gooeyCircle above:self.line];
            self.layer.masksToBounds = NO;

        
            break;

        case IndicatorStyleRotateRect:
            
            self.rotateRect = [RotateRect layer];
            self.indicator = self.rotateRect;
            self.rotateRect.indicatorColor = self.selectedColor;
            
            self.rotateRect.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
            self.rotateRect.indicatorSize  = self.indicatorSize;
            self.rotateRect.contentsScale = [UIScreen mainScreen].scale;
            [self.rotateRect animateIndicatorWithScrollView:self.bindScrollView andIndicator:self];
            [self.layer insertSublayer:self.rotateRect above:self.line];
            self.layer.masksToBounds = NO;
            
            break;
            
        default:
            break;
    }
}

#pragma mark -- UITapGestureRecognizer tapAction
-(void)tapAction:(UITapGestureRecognizer *)ges{
    
    NSAssert(self.bindScrollView != nil, @"You can not scroll without assigning bindScrollView");
    CGPoint location = [ges locationInView:self];
    if (CGRectContainsPoint(self.line.frame, location)) {
        CGFloat ballDistance = self.frame.size.width / (self.pageCount - 1);
        NSInteger index =  location.x / ballDistance;
        if ((location.x - index*ballDistance) >= ballDistance/2) {
            index += 1;
        }
        CGFloat HOWMANYDISTANCE =  ABS((self.line.selectedLineLength - index *((self.line.frame.size.width - self.line.ballDiameter) / (self.line.pageCount - 1)))) / ((self.line.frame.size.width - self.line.ballDiameter) / (self.line.pageCount - 1));
        NSLog(@"howmanydistance:%f",HOWMANYDISTANCE/self.pageCount);
        
        //背景线条动画
        [self.line animateSelectedLineToNewIndex:index+1];

        //scrollview 滑动
        [self.bindScrollView setContentOffset:CGPointMake(self.bindScrollView.frame.size.width *index, 0) animated:YES];
        
        //恢复动画
        [self.indicator performSelector:@selector(restoreAnimation:) withObject:@(HOWMANYDISTANCE/self.pageCount) afterDelay:0.2];

        self.didSelectIndexBlock(index+1);
    }
    
}

-(void)animateToIndex:(NSInteger)index
{
    NSAssert(self.bindScrollView != nil, @"You can not scroll without assigning bindScrollView");
    CGFloat HOWMANYDISTANCE =  ABS((self.line.selectedLineLength - index *((self.line.frame.size.width - self.line.ballDiameter) / (self.line.pageCount - 1)))) / ((self.line.frame.size.width - self.line.ballDiameter) / (self.line.pageCount - 1));
    NSLog(@"howmanydistance:%f",HOWMANYDISTANCE/self.pageCount);
    
    //背景线条动画
    [self.line animateSelectedLineToNewIndex:index+1];
    
    //scrollview 滑动
    [self.bindScrollView setContentOffset:CGPointMake(self.bindScrollView.frame.size.width *index, 0) animated:YES];
    
    //恢复动画
    [self.indicator performSelector:@selector(restoreAnimation:) withObject:@(HOWMANYDISTANCE/self.pageCount) afterDelay:0.2];
    
    NSLog(@"DidSelected index:%ld",(long)index+1);
}

- (void)panAction:(UIPanGestureRecognizer *)pan {
    if (!_swipeEnable) {
        return;
    }
    
    CGPoint location = [pan locationInView:self];
    if (CGRectContainsPoint(self.line.frame, location)) {
        CGFloat ballDistance = self.frame.size.width / (self.pageCount - 1);
        NSInteger index =  location.x / ballDistance;
        if ((location.x - index*ballDistance) >= ballDistance/2) {
            index += 1;
        }
        
        if (index != _lastIndex) {
            [self animateToIndex:index];
            _lastIndex = index;
        }
    }
}

@end

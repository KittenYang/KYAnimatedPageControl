//
//  KYAnimatedPageControl+UIScrollViewDelegate.m
//  KYAnimatedPageControl-Demo
//
//  Created by jiakai lian on 26/07/2015.
//  Copyright (c) 2015 Kitten Yang. All rights reserved.
//

#import "KYAnimatedPageControl+UIScrollViewDelegate.h"

@implementation KYAnimatedPageControl (UIScrollViewDelegate) 


#pragma mark -- UIScrollViewDelegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    //Indicator动画
    [self.indicator animateIndicatorWithScrollView:scrollView andIndicator:self];
    
    if (scrollView.dragging || scrollView.isDecelerating || scrollView.tracking) {
        //背景线条动画
        [self.pageControlLine animateSelectedLineWithScrollView:scrollView];
    }
    
}


-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    self.indicator.lastContentOffset = scrollView.contentOffset.x;
    
}

-(void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
    
    [self.indicator restoreAnimation:@(1.0/self.pageCount)];
    
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    self.indicator.lastContentOffset = scrollView.contentOffset.x;
}



@end

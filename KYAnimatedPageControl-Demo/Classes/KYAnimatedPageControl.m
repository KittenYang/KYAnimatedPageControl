//
//  KYAnimatedPageControl.m
//  KYAnimatedPageControl-Demo
//
//  Created by Kitten Yang on 6/10/15.
//  Copyright (c) 2015 Kitten Yang. All rights reserved.
//

#import "KYAnimatedPageControl.h"


@interface KYAnimatedPageControl()

@property(nonatomic,strong)Line *line;

@end

@implementation KYAnimatedPageControl

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
        [self addGestureRecognizer:self.tap];

    }
    return self;
}


#pragma mark -- PUBLIC Method
-(void)display{
    
    self.line = [Line layer];
    self.line.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    self.line.pageCount = self.pageCount;
    self.line.selectedPage = self.selectedPage;
    self.line.unSelectedColor = self.unSelectedColor;
    self.line.selectedColor = self.selectedColor;
    self.line.bindScrollView = self.bindScrollView;
    
    self.line.contentsScale = [UIScreen mainScreen].scale;
    [self.line setNeedsDisplay];
    [self.layer addSublayer:self.line];
    
}

-(Line *)pageControlLine{
    return self.line;
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
        
        [self.line animateSelectedLineToNewIndex:index+1];
        [self.bindScrollView setContentOffset:CGPointMake(self.bindScrollView.frame.size.width *index, 0) animated:YES];
        NSLog(@"DidSelected index:%ld",(long)index+1);
    }
    
}





@end

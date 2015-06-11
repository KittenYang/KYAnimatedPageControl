//
//  KYAnimatedPageControl.m
//  KYAnimatedPageControl-Demo
//
//  Created by Kitten Yang on 6/10/15.
//  Copyright (c) 2015 Kitten Yang. All rights reserved.
//

#import "KYAnimatedPageControl.h"
#import "Line.h"

@interface KYAnimatedPageControl()

@property(nonatomic,strong)Line *line;

@end

@implementation KYAnimatedPageControl

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
        [self addGestureRecognizer:tap];

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
    
    self.line.contentsScale = [UIScreen mainScreen].scale;
    [self.line setNeedsDisplay];
    [self.layer addSublayer:self.line];
    
}



#pragma mark -- UITapGestureRecognizer tapAction
-(void)tapAction:(UITapGestureRecognizer *)ges{
    CGPoint location = [ges locationInView:self];
    if (CGRectContainsPoint(self.line.frame, location)) {
        CGFloat ballDistance = self.frame.size.width / (self.pageCount - 1);
        NSInteger index =  location.x / ballDistance;
        if ((location.x - index*ballDistance) >= ballDistance/2) {
            index += 1;
        }
        
        [self.line animateSelectedLineToNewIndex:index+1];
        NSLog(@"DidSelected index:%ld",(long)index+1);
    }
    
}





@end

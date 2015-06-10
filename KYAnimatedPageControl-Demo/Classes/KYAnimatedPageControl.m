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

    }
    return self;
}


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






@end

//
//  Line.m
//  KYAnimatedPageControl-Demo
//
//  Created by Kitten Yang on 6/11/15.
//  Copyright (c) 2015 Kitten Yang. All rights reserved.


//相邻小球之间的距离
#define DISTANCE (self.frame.size.width - self.ballDiameter) / (self.pageCount - 1)

#import "Line.h"
#import "KYSpringLayerAnimation.h"


@interface Line()


//选中的长度
@property(nonatomic,assign)CGFloat selectedLineLength;

@end

@implementation Line

-(id)init{
    
    self = [super init];
    if (self) {

        //属性默认值
        self.selectedPage = 1;
        self.lineHeight = 2.0;
        self.ballDiameter = 10.0;
        self.unSelectedColor = [UIColor colorWithWhite:0.9 alpha:1];
        self.selectedColor   = [UIColor redColor];
        self.shouldShowProgressLine = YES;
        self.pageCount = 6;
        self.masksToBounds = NO;
    }
    
    return self;
}

-(void)setSelectedPage:(NSInteger)selectedPage{
    if (_selectedPage != selectedPage) {
        _selectedPage = selectedPage;
        
        self.selectedLineLength = self.pageCount > 1 ? (selectedPage-1) * DISTANCE : 0;
    }

}

+ (BOOL)needsDisplayForKey:(NSString *)key{
    if ([key isEqual: @"selectedLineLength"]) {
        return  YES;
    }
    return [super needsDisplayForKey:key];
    
}


//invoke when call setNeedDisplay
-(void)drawInContext:(CGContextRef)ctx{
    
    NSAssert(self.selectedPage <= self.pageCount, @"ERROR:PageCount can not less than selectedPage");
    
    if (self.pageCount == 1) {
        CGMutablePathRef linePath = CGPathCreateMutable();
        CGPathMoveToPoint(linePath, nil, self.frame.size.width/2, self.frame.size.height/2);
        CGRect circleRect = CGRectMake(self.frame.size.width/2 - self.ballDiameter/2, self.frame.size.height / 2 - self.ballDiameter / 2, self.ballDiameter, self.ballDiameter);
        CGPathAddEllipseInRect(linePath, nil, circleRect);
        CGContextAddPath(ctx, linePath);
        CGContextSetFillColorWithColor(ctx, self.selectedColor.CGColor);
        CGContextFillPath(ctx);
        
        return;
    }
    
    
    CGMutablePathRef linePath = CGPathCreateMutable();
    
    CGPathMoveToPoint(linePath, nil, self.ballDiameter/2, self.frame.size.height/2);
    
    //画默认颜色的背景线
    CGPathAddRoundedRect(linePath, nil, CGRectMake(self.ballDiameter/2, self.frame.size.height/2 - self.lineHeight/2, self.frame.size.width - self.ballDiameter, self.lineHeight), 0, 0);
    
    //画pageCount个小圆
    for (NSInteger i = 0; i<self.pageCount; i++) {
        
        CGRect circleRect = CGRectMake(0 + i*DISTANCE, self.frame.size.height / 2 - self.ballDiameter / 2, self.ballDiameter, self.ballDiameter);
        CGPathAddEllipseInRect(linePath, nil, circleRect);
        
    }
    
    CGContextAddPath(ctx, linePath);
    CGContextSetFillColorWithColor(ctx, self.unSelectedColor.CGColor);
    CGContextFillPath(ctx);
    
    
    if (self.shouldShowProgressLine == YES) {
        CGContextBeginPath(ctx);
        linePath = CGPathCreateMutable();

        //画带颜色的线
        CGPathAddRoundedRect(linePath, nil, CGRectMake(self.ballDiameter/2, self.frame.size.height/2 - self.lineHeight/2, self.selectedLineLength , self.lineHeight), 0, 0);
        
        //画pageCount个有色小圆
        for (NSInteger i = 0; i<self.selectedPage; i++) {
            
            CGRect circleRect = CGRectMake(0 + i*DISTANCE, self.frame.size.height / 2 - self.ballDiameter / 2, self.ballDiameter, self.ballDiameter);
            CGPathAddEllipseInRect(linePath, nil, circleRect);
            
        }
        
        CGContextAddPath(ctx, linePath);
        CGContextSetFillColorWithColor(ctx, self.selectedColor.CGColor);
        CGContextFillPath(ctx);

    }

}



#pragma mark -- length animation
-(void)animateSelectedLineLengthTo:(CGFloat)newLength{
    CABasicAnimation *anim = [KYSpringLayerAnimation create:@"selectedLineLength" duration:0.2 fromValue:@(self.selectedLineLength) toValue:@(newLength)];
    
    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    self.selectedLineLength = newLength;
    [self addAnimation:anim forKey:@"lineAnimation"];
    
}



@end

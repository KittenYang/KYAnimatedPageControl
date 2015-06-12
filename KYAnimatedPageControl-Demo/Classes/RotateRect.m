//
//  RotateRect.m
//  KYAnimatedPageControl-Demo
//
//  Created by Kitten Yang on 6/12/15.
//  Copyright (c) 2015 Kitten Yang. All rights reserved.
//

#import "RotateRect.h"
#import "KYAnimatedPageControl.h"


@interface RotateRect()

@property(nonatomic,assign)CGRect currentRect;

@end

@implementation RotateRect{
    CGAffineTransform initialTransform;
    CAShapeLayer *indicatorLayer;
}

-(id)init{
    self = [super init];
    if (self) {

        indicatorLayer = [CAShapeLayer layer];
        indicatorLayer.transform = CATransform3DMakeRotation(M_PI_4, 0, 0, 1);
        [self addSublayer:indicatorLayer];
        
        
    }
    return self;
}

-(id)initWithLayer:(RotateRect *)layer{
    self = [super initWithLayer:layer];
    if (self) {
        
        self.indicatorSize = layer.indicatorSize;
        
    }
    return self;
}

-(void)drawInContext:(CGContextRef)ctx{

//    CGPoint center = CGPointMake((self.line.frame.size.width / (self.pageCount -1)) * (self.selectedPage - 1), self.line.frame.size.height/2);
    
//    CGMutablePathRef rectPath = CGPathCreateMutable();
//    CGPathMoveToPoint(rectPath, nil, self.currentRect.origin.x, self.currentRect.origin.y);
//    CGPathAddRect(rectPath, nil, self.currentRect);
//    
//

    
    UIBezierPath *rectPath = [UIBezierPath bezierPathWithRect:self.currentRect];
//    [[UIColor blueColor] setFill];
//    [path fill];
    CGContextAddPath(ctx, rectPath.CGPath);
    CGContextSetFillColorWithColor(ctx, [UIColor orangeColor].CGColor);
    CGContextFillPath(ctx);

    indicatorLayer.path = rectPath.CGPath;


}




-(void)animateIndicatorWithScrollView:(UIScrollView *)scrollView andIndicator:(KYAnimatedPageControl *)pgctl{
    

    CGFloat originX = (scrollView.contentOffset.x / scrollView.frame.size.width) * (pgctl.frame.size.width / (pgctl.pageCount-1));
    
    if (originX - self.indicatorSize/2 <= 0) {
        
        self.currentRect = CGRectMake(0, self.frame.size.height/2-self.indicatorSize/2, self.indicatorSize, self.indicatorSize);
        
    }else if ((originX - self.indicatorSize/2) >= self.frame.size.width - self.indicatorSize){
        
        self.currentRect = CGRectMake(self.frame.size.width - self.indicatorSize, self.frame.size.height/2-self.indicatorSize/2, self.indicatorSize, self.indicatorSize);
        
    }else{
        
        self.currentRect = CGRectMake(originX - self.indicatorSize/2, self.frame.size.height/2-self.indicatorSize/2, self.indicatorSize, self.indicatorSize);
    }
    

    [self setNeedsDisplay];
    
}

@end

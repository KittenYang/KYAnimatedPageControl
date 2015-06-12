//
//  GooeyCircle.m
//  KYAnimatedPageControl-Demo
//
//  Created by Kitten Yang on 6/11/15.
//  Copyright (c) 2015 Kitten Yang. All rights reserved.
//

#import "GooeyCircle.h"

@interface GooeyCircle()

@property(nonatomic,assign)CGFloat testVar;


@end

@implementation GooeyCircle

#pragma mark -- Initialize
-(id)init{
    self = [super init];
    if (self) {
        
    }
    return self;
}


-(id)initWithLayer:(GooeyCircle *)layer{
    self = [super initWithLayer:layer];
    if (self) {
        
        self.indicatorSize = layer.indicatorSize;
        
    }
    return self;
}


#pragma mark -- override  class func

- (void)drawInContext:(CGContextRef)ctx{
    

}




#pragma mark -- override superclass method
-(void)animateIndicatorWithScrollView:(UIScrollView *)scrollView andIndicator:(KYAnimatedPageControl *)pgctl{
    
    CGFloat testVar = scrollView.contentOffset.x;
    
    //变量:

    [self setNeedsDisplay];


    
}


@end

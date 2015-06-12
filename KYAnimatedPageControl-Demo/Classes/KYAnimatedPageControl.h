//
//  KYAnimatedPageControl.h
//  KYAnimatedPageControl-Demo
//
//  Created by Kitten Yang on 6/10/15.
//  Copyright (c) 2015 Kitten Yang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Indicator.h"
#import "Line.h"


typedef enum : NSUInteger {
    IndicatorStyleGooeyCircle, // 0
    IndicatorStyleRotateRect,  // 1
} IndicatorStyle;

@interface KYAnimatedPageControl : UIView


//----READWRITE----
//page的个数
@property(nonatomic,assign)NSInteger pageCount;

//选中的item  1,2,3,4
@property(nonatomic,assign)NSInteger selectedPage;

//未选中的颜色
@property(nonatomic,strong)UIColor *unSelectedColor;

//选中的颜色
@property(nonatomic,strong)UIColor *selectedColor;

//绑定的滚动视图
@property(nonatomic,strong)UIScrollView *bindScrollView;

//Indicator样式
@property(nonatomic,assign)IndicatorStyle indicatorStyle;

//Indicator大小
@property(nonatomic,assign)CGFloat indicatorSize;

//Indicator
@property(nonatomic,strong)Indicator *indicator;


//-----READONLY-----
//直线Layer
@property(nonatomic,readonly)Line *pageControlLine;



//设置完所有参数后，启动这个方法 
-(void)display;

@end

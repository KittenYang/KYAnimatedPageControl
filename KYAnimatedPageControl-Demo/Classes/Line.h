//
//  Line.h
//  KYAnimatedPageControl-Demo
//
//  Created by Kitten Yang on 6/11/15.
//  Copyright (c) 2015 Kitten Yang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface Line : CALayer

//page的个数
@property(nonatomic,assign)NSInteger pageCount;

//选中的item  1,2,3,4
@property(nonatomic,assign)NSInteger selectedPage;

//是否开启进度显示
@property(nonatomic,assign)BOOL shouldShowProgressLine;

//pageControl线的高度
@property(nonatomic,assign)CGFloat lineHeight;

//小球的直径
@property(nonatomic,assign)CGFloat ballDiameter;

//未选中的颜色
@property(nonatomic,strong)UIColor *unSelectedColor;

//选中的颜色
@property(nonatomic,strong)UIColor *selectedColor;



//直线动画接口
-(void)animateSelectedLineToNewIndex:(NSInteger)newIndex;

@end

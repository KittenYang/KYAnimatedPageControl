//
//  KYAnimatedPageControl.h
//  KYAnimatedPageControl-Demo
//
//  Created by Kitten Yang on 6/10/15.
//  Copyright (c) 2015 Kitten Yang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Line.h"

@interface KYAnimatedPageControl : UIView


//page的个数
@property(nonatomic,assign)NSInteger pageCount;

//选中的item  1,2,3,4
@property(nonatomic,assign)NSInteger selectedPage;

//未选中的颜色
@property(nonatomic,strong)UIColor *unSelectedColor;

//选中的颜色
@property(nonatomic,strong)UIColor *selectedColor;

//直线Layer
@property(nonatomic,readonly)Line *pageControlLine;

//绑定的滚动视图
@property(nonatomic,strong)UIScrollView *bindScrollView;

//读取手势
@property(nonatomic,strong)UITapGestureRecognizer *tap;

//设置完所有参数后，启动这个方法
-(void)display;

@end

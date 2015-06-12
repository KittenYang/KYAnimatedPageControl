<p align="left" >
  <img src="logo.png" alt="KYAnimatedPageControl" title="KYAnimatedPageControl" width = "700">
</p>

![CocoaPods Version](https://img.shields.io/badge/pod-v1.0.1-brightgreen.svg)
![License](https://img.shields.io/badge/license-MIT-blue.svg)
![Platform](https://img.shields.io/badge/platform-iOS-red.svg)


##Intro

A custom **UIPageControl** with multiple animations. With two animation styles:

自定义的**UIPageControl**。拥有两种动画样式:

* **GooeyCircle**

* **粘性小球** 

<p align="left" >
  <img src="gooeyCircle.gif" alt="gooeyCircle" title="gooeyCircle" width = "320">
</p>


* **RotateRect**
* **旋转方块**

<p align="left" >
  <img src="rotateRect.gif" alt="rotateRect" title="rotateRect" width = "320">
</p>


##Installation

`pod 'KYAnimatedPageControl', '~> 1.0.1'`


##Usage

###Initialize:

```objc
    self.pageControl = [[KYAnimatedPageControl alloc]initWithFrame:CGRectMake(20, 450, 280, 50)];
    self.pageControl.pageCount = 8;
    self.pageControl.unSelectedColor = [UIColor colorWithWhite:0.9 alpha:1];
    self.pageControl.selectedColor = [UIColor redColor];
    self.pageControl.bindScrollView = self.demoCollectionView;
    
    self.pageControl.indicatorStyle = IndicatorStyleRotateRect;
    self.pageControl.indicatorSize = 20;
    [self.pageControl display];
    [self.view addSubview:self.pageControl];

```

###Add methods to UIScrollDelegate:

```objc

#pragma mark -- UIScrollViewDelegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{

    //Indicator动画
    [self.pageControl.indicator animateIndicatorWithScrollView:scrollView andIndicator:self.pageControl];

    if (scrollView.dragging || scrollView.isDecelerating || scrollView.tracking) {
        //背景线条动画
        [self.pageControl.pageControlLine animateSelectedLineWithScrollView:scrollView];
    }
    
}


-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    self.pageControl.indicator.lastContentOffset = scrollView.contentOffset.x;
}

-(void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{

    if ( self.pageControl.indicatorStyle == IndicatorStyleGooeyCircle) {

        [self.pageControl.indicator restoreAnimation:@(1.0/self.pageControl.pageCount)];
    }
}

```

##版本
##Version

###v1.0.1 

 增加粘性小球样式
 
###v1.0.0
  
  第一次提交：完成旋转方块样式
  

##License
This project is under MIT License. See LICENSE file for more information.




##*Hold on a second...*

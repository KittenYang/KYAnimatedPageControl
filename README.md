<p align="left" >
  <img src="logo.png" alt="KYAnimatedPageControl" title="KYAnimatedPageControl" width = "700">
</p>

![CocoaPods Version](https://img.shields.io/badge/pod-v1.0.4-brightgreen.svg)
![License](https://img.shields.io/badge/license-MIT-blue.svg)
![Platform](https://img.shields.io/badge/platform-iOS-red.svg)

##Intro

A custom **UIPageControl** with multiple animations. With two animation styles:

(自定义的**UIPageControl**。拥有两种动画样式:)

* **GooeyCircle**

* **粘性小球** 

<p align="left" >
  <img src="gooeyCircle.gif" alt="gooeyCircle" title="gooeyCircle" width = "320">
</p>

**Detail 细节**
>The longer distance the bubble moves , the severer gooey effect it has.

>粘性小球会根据移动距离的大小拥有不同的弹性程度。移动距离越大，弹性效果越明显。

* **RotateRect**
* **旋转方块**

<p align="left" >
  <img src="rotateRect.gif" alt="rotateRect" title="rotateRect" width = "320">
</p>


> You can not only scroll the UIScrollView subclasses such as UICollectionView ,UITableView and the **KYAnimatedPageControl** can automatically move with animation ,but also you can just **TAP** the target page in the **KYAnimatedPageControl**,and the scrollview will also automatically and intelligently scroll to the target position.

>**KYAnimatedPageControl** 不仅可以在你滑动UIScrollView的时候自动以动画的形式移动，而且你还可以直接在**KYAnimatedPageControl**上的点击要滚动到的目标页，此时除了**KYAnimatedPageControl**会以动画的形式移动，UIScrollView会很智能地滑到目标页面。

##Blog

[谈谈iOS中粘性动画以及果冻效果的实现](http://kittenyang.com/deformationandgooey/)

##Installation

`pod 'KYAnimatedPageControl', '~> 1.0.4'`


##Usage

###Initialize:

```objc
    self.pageControl = [[KYAnimatedPageControl alloc]initWithFrame:CGRectMake(20, 450, 280, 50)];
    self.pageControl.pageCount = 8;
    self.pageControl.unSelectedColor = [UIColor colorWithWhite:0.9 alpha:1];
    self.pageControl.selectedColor = [UIColor redColor];
    self.pageControl.bindScrollView = self.demoCollectionView;
    self.pageControl.shouldShowProgressLine = YES;
    
    self.pageControl.indicatorStyle = IndicatorStyleGooeyCircle;
    self.pageControl.indicatorSize = 20;
    [self.pageControl display];
    [self.view addSubview:self.pageControl];

```

###Must implement methods in UIScrollViewDelegate:

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

    
    [self.pageControl.indicator restoreAnimation:@(1.0/self.pageControl.pageCount)];

}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    self.pageControl.indicator.lastContentOffset = scrollView.contentOffset.x;
}

```

##版本
##Version

###v1.0.4

 * 增加点击某个Index的回调。


###v1.0.3

 * 取消方块的结束抖动效果（需要可打开注释的代码）
 * 改进判断滑动方向的算法。由之前的（当前contentOffset.x - 上一次的contentOffset.x）来判断方向，改成现在的（当前contentOffset.x - 上一次的contentOffset.x）是否划过一半来判断方向。
 * 增加UIPanGesture。现在可以拖动Indicator了，小球会跟着你的手指跑了。通过新增的`@property(nonatomic,assign)BOOL swipeEnable;` 接口可以选择是否开启拖动手势。
 * 增加一个接口方法。调用可以快速跳到目标页而不用点击。 `-(void)animateToIndex:(NSInteger)index;`


###v1.0.2

 * 增加旋转方块的抖动效果

###v1.0.1 

 * 增加粘性小球样式
 
###v1.0.0
  
  * 第一次提交：完成旋转方块样式
  

##License
This project is under MIT License. See LICENSE file for more information.




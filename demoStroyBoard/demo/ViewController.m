//
//  ViewController.m
//  demo
//
//  Created by Alexcai on 15/6/13.
//  Copyright (c) 2015年 zhidier. All rights reserved.
//

#import "ViewController.h"
#import "KYAnimatedPageControl.h"
#import "ACDeomCellCollectionViewCell.h"

@interface ViewController () <UICollectionViewDataSource,UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *demoCollectionView;
@property (weak, nonatomic) IBOutlet KYAnimatedPageControl *kyPageController;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.kyPageController.pageCount = 3;
//    self.kyPageController.unSelectedColor = [UIColor colorWithWhite:0.9 alpha:1];
//    self.kyPageController.selectedColor = [UIColor redColor];
    self.kyPageController.bindScrollView = self.demoCollectionView;
//    self.kyPageController.indicatorStyle = IndicatorStyleGooeyCircle;
//    self.kyPageController.indicatorSize = 20;
    [self.kyPageController display];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.kyPageController.pageCount;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ACDeomCellCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"demo" forIndexPath:indexPath];
    return cell;
}


#pragma mark -- UIScrollViewDelegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    //Indicator动画
    [self.kyPageController.indicator animateIndicatorWithScrollView:scrollView andIndicator:self.kyPageController];
    
    if (scrollView.dragging || scrollView.isDecelerating || scrollView.tracking) {
        //背景线条动画
        [self.kyPageController.pageControlLine animateSelectedLineWithScrollView:scrollView];
    }
    
}


-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    self.kyPageController.indicator.lastContentOffset = scrollView.contentOffset.x;
}

-(void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
    
    if ( self.kyPageController.indicatorStyle == IndicatorStyleGooeyCircle) {
        
        [self.kyPageController.indicator restoreAnimation:@(1.0/self.kyPageController.pageCount)];
    }
}


@end

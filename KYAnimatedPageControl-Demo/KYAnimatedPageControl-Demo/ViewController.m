//
//  ViewController.m
//  KYAnimatedPageControl-Demo
//
//  Created by Kitten Yang on 6/9/15.
//  Copyright (c) 2015 Kitten Yang. All rights reserved.
//

#import "ViewController.h"
#import "KYAnimatedPageControl.h"
#import "DemoCell.h"

@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>

@property(nonatomic,strong)KYAnimatedPageControl *pageControl;
@property (weak, nonatomic) IBOutlet UICollectionView *demoCollectionView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.pageControl = [[KYAnimatedPageControl alloc]initWithFrame:CGRectMake(20, 450, 280, 50)];
    self.pageControl.pageCount = 8;
//    self.pageControl.selectedPage = 6;
    self.pageControl.unSelectedColor = [UIColor colorWithWhite:0.9 alpha:1];
    self.pageControl.selectedColor = [UIColor orangeColor];
    self.pageControl.bindScrollView = self.demoCollectionView;
    
    self.pageControl.indicatorStyle = IndicatorStyleRotateRect;
    self.pageControl.indicatorSize = 20;
    [self.pageControl display];
    [self.view addSubview:self.pageControl];
    
}




#pragma mark  -- UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return self.pageControl.pageCount;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    DemoCell *democell = (DemoCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"democell" forIndexPath:indexPath];
    democell.cellNumLabel.text = [NSString stringWithFormat:@"%ld",indexPath.item + 1];
    
    return democell;
    
}



#pragma mark -- UIScrollViewDelegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{

    [self.pageControl.indicator animateIndicatorWithScrollView:scrollView andIndicator:self.pageControl];
    if (scrollView.dragging || scrollView.isDecelerating || scrollView.tracking) {
        [self.pageControl.pageControlLine animateSelectedLineWithScrollView:scrollView];
    
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}









@end

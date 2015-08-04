//
//  ViewControllerStoryboard.m
//  KYAnimatedPageControl-Demo
//
//  Created by jiakai lian on 26/07/2015.
//  Copyright (c) 2015 Kitten Yang. All rights reserved.
//

#import "ViewControllerStoryboard.h"
#import "KYAnimatedPageControl.h"
#import "DemoCell.h"

@interface ViewControllerStoryboard ()<UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet KYAnimatedPageControl *pageControl;
@property (weak, nonatomic) IBOutlet UICollectionView *demoCollectionView;

@end

@implementation ViewControllerStoryboard

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.pageControl.bindScrollView = self.demoCollectionView;
//    ((UIScrollView *)self.demoCollectionView).delegate = self.pageControl.bindScrollViewDelegate;
    [self.pageControl addDelegate:nil];
    
    self.pageControl.pageCount = 8;
    self.pageControl.unSelectedColor = [UIColor colorWithWhite:0.9 alpha:1];
    self.pageControl.selectedColor = [UIColor redColor];
    
    self.pageControl.shouldShowProgressLine = YES;
    
    self.pageControl.indicatorStyle = IndicatorStyleGooeyCircle;
    self.pageControl.indicatorSize = 20;
    self.pageControl.swipeEnable = YES;
    
    self.pageControl.didSelectIndexBlock = ^(NSInteger index){
        NSLog(@"Did Selected index : %ld",(long)index);
    };

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark  -- UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return self.pageControl.pageCount;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    DemoCell *democell = (DemoCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"democell" forIndexPath:indexPath];
    democell.cellNumLabel.text = [NSString stringWithFormat:@"%d",indexPath.item + 1];
    
    return democell;
    
}


@end

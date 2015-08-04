//
//  KYAnimatedPageControl+UICollectionViewDelegate.m
//  KYAnimatedPageControl-Demo
//
//  Created by jiakai lian on 26/07/2015.
//  Copyright (c) 2015 Kitten Yang. All rights reserved.
//

#import "KYAnimatedPageControl+UICollectionViewDelegate.h"

@implementation KYAnimatedPageControl (UICollectionViewDelegate)


#pragma mark -- UICollectionViewDelegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    //Indicator动画
    [self.indicator animateIndicatorWithScrollView:scrollView andIndicator:self];
    
    if (scrollView.dragging || scrollView.isDecelerating || scrollView.tracking) {
        //背景线条动画
        [self.pageControlLine animateSelectedLineWithScrollView:scrollView];
    }
    
}


-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    self.indicator.lastContentOffset = scrollView.contentOffset.x;
    
}

-(void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
    
    [self.indicator restoreAnimation:@(1.0/self.pageCount)];
    
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    self.indicator.lastContentOffset = scrollView.contentOffset.x;
}

#pragma mark - UICollectionViewDelegate
//declare these method to enforce the system to trigger the events
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{

}

- (void)collectionView:(UICollectionView *)collectionView didHighlightItemAtIndexPath:(NSIndexPath *)indexPath
{

}

- (void)collectionView:(UICollectionView *)collectionView didUnhighlightItemAtIndexPath:(NSIndexPath *)indexPath
{

}

- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{

}

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath
{

}

- (void)collectionView:(UICollectionView *)collectionView willDisplaySupplementaryView:(UICollectionReusableView *)view forElementKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)indexPath
{

}

- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath
{

}

- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingSupplementaryView:(UICollectionReusableView *)view forElementOfKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)indexPath
{

}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender
{

}


@end

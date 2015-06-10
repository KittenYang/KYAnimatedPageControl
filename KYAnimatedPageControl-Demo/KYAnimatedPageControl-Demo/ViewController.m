//
//  ViewController.m
//  KYAnimatedPageControl-Demo
//
//  Created by Kitten Yang on 6/9/15.
//  Copyright (c) 2015 Kitten Yang. All rights reserved.
//

#import "ViewController.h"
#import "KYAnimatedPageControl.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    KYAnimatedPageControl *pageControl = [[KYAnimatedPageControl alloc]initWithFrame:CGRectMake(20, 400, 280, 50)];
    pageControl.pageCount = 6;
    pageControl.selectedPage = 4;
    pageControl.unSelectedColor = [UIColor colorWithWhite:0.9 alpha:1];
    pageControl.selectedColor = [UIColor orangeColor];
    [pageControl display];
    [self.view addSubview:pageControl];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

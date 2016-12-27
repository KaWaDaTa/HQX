//
//  ViewController.m
//  HQX
//
//  Created by Medxing on 16/12/27.
//  Copyright © 2016年 Medxing. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate>{
    UIScrollView *_smallScrollView;
    UIScrollView *_bigScrollView;
    
    BOOL _isBigger;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _isBigger = NO;
//    NSArray *array = @[[UIColor redColor],[UIColor lightGrayColor],[UIColor blueColor],[UIColor greenColor],[UIColor yellowColor],[UIColor cyanColor],[UIColor blackColor],[UIColor purpleColor],[UIColor orangeColor],[UIColor darkGrayColor]];
    NSArray *array = @[[UIColor redColor],[UIColor lightGrayColor],[UIColor blueColor],[UIColor greenColor]];

    _bigScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 100, CGRectGetWidth(self.view.frame), CGRectGetWidth(self.view.frame))];
    _bigScrollView.scrollEnabled = NO;
    _bigScrollView.contentSize = CGSizeMake(CGRectGetWidth(self.view.frame)*3/4*array.count+25, 0);
    for(int i=0;i<array.count;i++){
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(25+i*CGRectGetWidth(self.view.frame)*3/4, 0, CGRectGetWidth(self.view.frame)*3/4-25, CGRectGetWidth(self.view.frame))];
        view.backgroundColor = array[i];
        [_bigScrollView addSubview:view];
		
		UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
		btn.tag = 100 + i;
		[btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
		btn.frame = CGRectMake(100, 100, 150, 50);
		btn.backgroundColor = [UIColor purpleColor];
		[view addSubview:btn];
		
    }
    [self.view addSubview:_bigScrollView];
    
    _smallScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(25, 0, CGRectGetWidth(self.view.frame)*3/4, CGRectGetWidth(self.view.frame))];
    _smallScrollView.showsHorizontalScrollIndicator = NO;
    _smallScrollView.showsVerticalScrollIndicator = NO;
    _smallScrollView.userInteractionEnabled = NO;
    _smallScrollView.delegate = self;
    [_bigScrollView addGestureRecognizer:_smallScrollView.panGestureRecognizer];
    _smallScrollView.bounces = YES;
    _smallScrollView.pagingEnabled = YES;
    _smallScrollView.contentSize = CGSizeMake(CGRectGetWidth(self.view.frame)*3/4*array.count+25-CGRectGetWidth(self.view.frame)/4, 0);
    [self.view addSubview:_smallScrollView];
}

- (void)btnClick:(UIButton *)sender {
	NSLog(@"%ld",sender.tag);
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
	NSLog(@"%s",__func__);
    _bigScrollView.contentOffset = _smallScrollView.contentOffset;
}

@end

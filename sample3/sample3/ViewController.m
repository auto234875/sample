//
//  ViewController.m
//  sample3
//
//  Created by John on 11/8/14.
//  Copyright (c) 2014 John. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CAGradientLayer *gradientLayer=[CAGradientLayer layer];
    gradientLayer.frame=self.view.bounds;
    [self.view.layer addSublayer:gradientLayer];
    
    gradientLayer.colors=@[(__bridge id)[UIColor redColor].CGColor,
                           (__bridge id)[UIColor whiteColor].CGColor];
    gradientLayer.startPoint=CGPointMake(0, 0);
    gradientLayer.endPoint=CGPointMake(1, 1);

}

@end

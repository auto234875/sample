//
//  ViewController.m
//  sample5
//
//  Created by John on 11/8/14.
//  Copyright (c) 2014 John. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic,strong)CALayer *layer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.layer=[CALayer layer];
    self.layer.frame = CGRectMake(50.0f, 50.0f, 100.0f, 100.0f);
    self.layer.backgroundColor = [UIColor blueColor].CGColor;
    [self.view.layer addSublayer:self.layer];
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(changeColor)];
    [self.view addGestureRecognizer:tap];
    
}

-(void)changeColor{
    [CATransaction begin];
    [CATransaction setAnimationDuration:1.0f];
    [CATransaction setCompletionBlock:^{
        CGAffineTransform transform=self.layer.affineTransform;
        transform = CGAffineTransformRotate(transform, M_PI_2);
        self.layer.affineTransform = transform;
    }];
    
    CGFloat red=arc4random()/(CGFloat)INT_MAX;
    CGFloat blue=arc4random()/(CGFloat)INT_MAX;
    CGFloat green=arc4random()/(CGFloat)INT_MAX;
    self.layer.backgroundColor=[UIColor colorWithRed:red green:green blue:blue alpha:1.0].CGColor;
    [CATransaction commit];

}

@end

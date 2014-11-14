//
//  ViewController.m
//  sample6
//
//  Created by John on 11/9/14.
//  Copyright (c) 2014 John. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIBezierPath *bezierPath=[[UIBezierPath alloc]init];
    [bezierPath moveToPoint:CGPointMake(0, 150)];
    [bezierPath addCurveToPoint:CGPointMake(300, 150) controlPoint1:CGPointMake(75, 0) controlPoint2:CGPointMake(75, 300)];
    
    CAShapeLayer *pathLayer=[CAShapeLayer layer];
    pathLayer.path=bezierPath.CGPath;
    pathLayer.fillColor=[UIColor clearColor].CGColor;
    pathLayer.strokeColor=[UIColor redColor].CGColor;
    pathLayer.lineWidth=3.0f;
    [self.view.layer addSublayer:pathLayer];
    
    CALayer *coloredLayer=[CALayer layer];
    coloredLayer.frame=CGRectMake(0, 0, 64, 64);
    coloredLayer.position=CGPointMake(0, 150);
    coloredLayer.backgroundColor=[UIColor blueColor].CGColor;
    [self.view.layer addSublayer:coloredLayer];
    CAKeyframeAnimation *animation1=[CAKeyframeAnimation animation];
    animation1.keyPath=@"position";
    animation1.path=bezierPath.CGPath;
    animation1.rotationMode=kCAAnimationRotateAuto;
    CABasicAnimation *animation2=[CABasicAnimation animation];
    animation2.keyPath=@"backgroundColor";
    animation2.toValue=(__bridge id)[UIColor purpleColor].CGColor;
    CAAnimationGroup *groupAnimation=[CAAnimationGroup animation];
    groupAnimation.animations=@[animation1,animation2];
    groupAnimation.duration=4.0;
    [coloredLayer addAnimation:groupAnimation forKey:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

//
//  ViewController.m
//  sample4
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
    UIView *view=[[UIView alloc] initWithFrame:CGRectMake(50, 100, 50, 50)];
    [self.view addSubview:view];
    CAReplicatorLayer *replicatorLayer=[CAReplicatorLayer layer];
    replicatorLayer.frame=view.bounds;
    [view.layer addSublayer:replicatorLayer];
    replicatorLayer.instanceCount=20;
    CATransform3D transform=CATransform3DIdentity;
    transform = CATransform3DTranslate(transform, 0, 200, 0);
    transform = CATransform3DRotate(transform, M_PI/5.0, 0, 0, 1);
    transform = CATransform3DTranslate(transform, 0, -200, 0);
    replicatorLayer.instanceTransform=transform;
    replicatorLayer.instanceBlueOffset=-0.01f;
    replicatorLayer.instanceGreenOffset = -0.01f;
   CALayer *layer = [CALayer layer];
    layer.frame = replicatorLayer.bounds;
    layer.backgroundColor = [UIColor whiteColor].CGColor;
    [replicatorLayer addSublayer:layer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

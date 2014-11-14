//
//  ViewController.m
//  sample7
//
//  Created by John on 11/14/14.
//  Copyright (c) 2014 John. All rights reserved.
//

#import "ViewController.h"
#define WIDTH 10
#define HEIGHT 10
#define DEPTH 10
#define SIZE 100
#define SPACING 150
#define CAMERA_DISTANCE 500

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor blackColor];
    UIScrollView *scrollView=[[UIScrollView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:scrollView];
    scrollView.contentSize = CGSizeMake((WIDTH - 1)*SPACING, (HEIGHT - 1)*SPACING);
    CATransform3D transform = CATransform3DIdentity;
    transform.m34 = -1.0 / CAMERA_DISTANCE;
    scrollView.layer.sublayerTransform = transform;
    //create layers
    
    
   for (int z = DEPTH - 1; z >= 0; z--)
       {
           for (int y = 0; y < HEIGHT; y++)
               {
                   for (int x = 0; x < WIDTH; x++)
                       {
                           //create layer
                           CALayer *layer = [CALayer layer];
                           layer.frame = CGRectMake(0, 0, SIZE, SIZE);
                           layer.position = CGPointMake(x*SPACING, y*SPACING);
                           layer.zPosition = -z*SPACING;
                           //set background color
                           layer.backgroundColor = [UIColor colorWithWhite:1-z*(1.0/DEPTH) alpha:1].CGColor;
                           //attach to scroll view
                           [scrollView.layer addSublayer:layer];
                       }
               }
       }

}


@end

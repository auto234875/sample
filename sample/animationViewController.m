//
//  animationViewController.m
//  sample
//
//  Created by John on 10/29/14.
//  Copyright (c) 2014 John. All rights reserved.
//
#import "animationViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface animationViewController ()
@property (nonatomic,strong) NSMutableArray *faces;


@end

@implementation animationViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    [self createFaces];
    
    CATransform3D perspective=CATransform3DIdentity;
    perspective.m34=-0.002;
    perspective = CATransform3DRotate(perspective, -M_PI_4, 1, 0, 0);
    
    perspective = CATransform3DRotate(perspective, -M_PI_4, 0, 1, 0);
    self.view.layer.sublayerTransform=perspective;
    CATransform3D transform= CATransform3DMakeTranslation(0, 0, 50);
    [self addFace:0 withTransform:transform];
    
    transform=CATransform3DMakeTranslation(50, 0, 0);
    transform=CATransform3DRotate(transform, M_PI_2, 0, 1, 0);
    [self addFace:1 withTransform:transform];
    
    transform=CATransform3DMakeTranslation(0, -50, 0);
    transform=CATransform3DRotate(transform, M_PI_2, 1, 0, 0);
    [self addFace:2 withTransform:transform];
    
    transform=CATransform3DMakeTranslation(0, 50, 0);
    transform=CATransform3DRotate(transform, -M_PI_2, 1, 0, 0);
    [self addFace:3 withTransform:transform];
    
    transform=CATransform3DMakeTranslation(-50, 0, 0);
    transform=CATransform3DRotate(transform, -M_PI_2, 0, 1, 0);
    [self addFace:4 withTransform:transform];
    
    transform=CATransform3DMakeTranslation(0, 0, -50);
    transform=CATransform3DRotate(transform, M_PI, 0, 1, 0);
    [self addFace:5 withTransform:transform];
    
    
    
    
    
}

-(void)makeFaceWithLength:(CGFloat)length andColor:(UIColor*)color thenInsertIntoArray:(NSMutableArray*)array{
    UIView *view=[[UIView alloc] initWithFrame:CGRectMake(0, 0, length, length)];
    view.backgroundColor=color;
    [array addObject:view];
}
-(void)createFaces{
    self.faces=[[NSMutableArray alloc] init];
    
    [self makeFaceWithLength:100.0f andColor:[UIColor redColor] thenInsertIntoArray:self.faces];
    [self makeFaceWithLength:100.0f andColor:[UIColor cyanColor] thenInsertIntoArray:self.faces];
    [self makeFaceWithLength:100.0f andColor:[UIColor blueColor] thenInsertIntoArray:self.faces];
    [self makeFaceWithLength:100.0f andColor:[UIColor yellowColor] thenInsertIntoArray:self.faces];
    [self makeFaceWithLength:100.0f andColor:[UIColor purpleColor] thenInsertIntoArray:self.faces];
    [self makeFaceWithLength:100.0f andColor:[UIColor orangeColor] thenInsertIntoArray:self.faces];
    
}
-(void)addFace:(NSInteger)index withTransform:(CATransform3D)transform{
    UIView *face=self.faces[index];
    [self.view addSubview:face];
    CGSize containerSize= self.view.bounds.size;
    face.center=CGPointMake(containerSize.width/2.0, containerSize.height/2.0);
    
    [UIView animateWithDuration:20
                          delay:0.00
                        options:UIViewAnimationOptionBeginFromCurrentState
                     animations:^{
                         face.layer.transform=transform;
                     } completion:^(BOOL finished) {
                     }];
}



@end



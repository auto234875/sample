//
//  animationViewController.m
//  sample
//
//  Created by John on 10/29/14.
//  Copyright (c) 2014 John. All rights reserved.
//
#import "animationViewController.h"
#import <QuartzCore/QuartzCore.h>
#import <GLKit/GLKit.h>

#define LIGHT_DIRECTION 0, 1, -0.5
#define AMBIENT_LIGHT 0.5

@interface animationViewController ()
@property (nonatomic,strong) NSMutableArray *faces;


@end

@implementation animationViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor lightGrayColor];
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

-(void)applyLightingToFace:(CALayer*)face{
    CALayer *layer=[CALayer layer];
    layer.frame=face.bounds;
    [face addSublayer:layer];
    
    CATransform3D transform= face.transform;
    GLKMatrix4 matrix4 = *(GLKMatrix4 *)&transform;
    GLKMatrix3 matrix3 = GLKMatrix4GetMatrix3(matrix4);
    //get face normal
    GLKVector3 normal = GLKVector3Make(0, 0, 1);
    normal = GLKMatrix3MultiplyVector3(matrix3, normal);
    normal = GLKVector3Normalize(normal);
    //get dot product with light direction
    GLKVector3 light = GLKVector3Normalize(GLKVector3Make(LIGHT_DIRECTION));
    float dotProduct = GLKVector3DotProduct(light, normal);
    //set lighting layer opacity
    CGFloat shadow = 1 + dotProduct - AMBIENT_LIGHT;
    UIColor *color = [UIColor colorWithWhite:0 alpha:shadow];
    layer.backgroundColor = color.CGColor;
    
    
    
}

-(void)makeFaceWithLength:(CGFloat)length andColor:(UIColor*)color thenInsertIntoArray:(NSMutableArray*)array{
    UIView *view=[[UIView alloc] initWithFrame:CGRectMake(0, 0, length, length)];
    view.backgroundColor=color;
    [array addObject:view];
}
-(void)createFaces{
    self.faces=[[NSMutableArray alloc] init];
    
    [self makeFaceWithLength:100.0f andColor:[UIColor whiteColor] thenInsertIntoArray:self.faces];
    [self makeFaceWithLength:100.0f andColor:[UIColor whiteColor] thenInsertIntoArray:self.faces];
    [self makeFaceWithLength:100.0f andColor:[UIColor whiteColor] thenInsertIntoArray:self.faces];
    [self makeFaceWithLength:100.0f andColor:[UIColor whiteColor] thenInsertIntoArray:self.faces];
    [self makeFaceWithLength:100.0f andColor:[UIColor whiteColor] thenInsertIntoArray:self.faces];
    [self makeFaceWithLength:100.0f andColor:[UIColor whiteColor] thenInsertIntoArray:self.faces];
    
}
-(void)addFace:(NSInteger)index withTransform:(CATransform3D)transform{
    UIView *face=self.faces[index];
    [self.view addSubview:face];
    CGSize containerSize= self.view.bounds.size;
    face.center=CGPointMake(containerSize.width/2.0, containerSize.height/2.0);
    
    [UIView animateWithDuration:10
                          delay:0.00
                        options:UIViewAnimationOptionBeginFromCurrentState
                     animations:^{
                         face.layer.transform=transform;
                         [self applyLightingToFace:face.layer];
                     } completion:^(BOOL finished) {
                     }];
}



@end



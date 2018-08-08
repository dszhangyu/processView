//
//  CircleProcessView.m
//  ZYProcessView
//
//  Created by dszhangyu on 2018/8/8.
//  Copyright © 2018年 dszhangyu. All rights reserved.
//

#import "CircleProcessView.h"

@interface CircleProcessView()
/** 圆CAShapeLayer */

@property(nonatomic,strong)CAShapeLayer *circleShapeLayer;
@end

@implementation CircleProcessView{
    
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setupView];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setupView];
    }
    return self;
}

-(void)awakeFromNib{
    [super awakeFromNib];
    [self setupView];
}

-(void)setupView{
    CGFloat selfW = self.bounds.size.width;
    
    ///虚线圆View=============
    
    self.layer.cornerRadius = selfW/2;
    
    self.layer.masksToBounds = YES;
    
    self.backgroundColor = [UIColor clearColor];
    
    self.transform = CGAffineTransformMakeRotation(-M_PI_2);
    
    CGFloat lineWidth =22.0;
    
    CGFloat left =2;
    
    CGFloat width = selfW-left*2;
    //  第一层浅白色的虚线圆
    
    CAShapeLayer *circleShapeLayer = [CAShapeLayer layer];
    
    circleShapeLayer.strokeColor = [UIColor colorWithRed:0.64 green:0.71 blue:0.87 alpha:0.2].CGColor;
    
    circleShapeLayer.fillColor = [UIColor clearColor].CGColor;
    
    circleShapeLayer.lineWidth= lineWidth;
    
    
    circleShapeLayer.path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(left,left,width,width)].CGPath;
    
    [self.layer addSublayer:circleShapeLayer];
    
    // 第二层黄色黄色的圆
    
    self.circleShapeLayer = [CAShapeLayer layer];
    
    self.circleShapeLayer.strokeColor = [UIColor yellowColor].CGColor;
//
    self.circleShapeLayer.fillColor = [UIColor clearColor].CGColor;
    
    self.circleShapeLayer.lineWidth = lineWidth;
    
    self.circleShapeLayer.path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(left,left,width,width)].CGPath;
    
    self.circleShapeLayer.strokeEnd = 0;
    
    [self.layer addSublayer:self.circleShapeLayer];
    
    //设置渐变颜色
    
    UIColor*endcolor =  [UIColor redColor];
    
    UIColor *startcolor = [UIColor greenColor];
    
    CAGradientLayer*gradientLayer =  [CAGradientLayer layer];
    
    gradientLayer.frame=self.bounds;
    
    [gradientLayer setColors:[NSArray arrayWithObjects:(id)startcolor.CGColor,(id)endcolor.CGColor,nil]];
    
    gradientLayer.startPoint=CGPointMake(0,0);
    
    gradientLayer.endPoint=CGPointMake(0,1);
    
    [gradientLayer setMask:self.circleShapeLayer]; //用progressLayer来截取渐变层
    
    [self.layer addSublayer:gradientLayer];

}

-(void)setProcessViewValue:(float)value{
    self.circleShapeLayer.strokeEnd = value;
}

@end

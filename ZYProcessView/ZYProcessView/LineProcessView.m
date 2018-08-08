//
//  LineProcessView.m
//  ZYProcessView
//
//  Created by dszhangyu on 2018/8/8.
//  Copyright © 2018年 dszhangyu. All rights reserved.
//

#import "LineProcessView.h"

@implementation LineProcessView{
    
    CAShapeLayer* _layer;
    
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
    CGFloat width =self.bounds.size.width;
    
    CGFloat height = self.bounds.size.height;
    
    UIBezierPath * bezierPath = [[UIBezierPath alloc]init];
    
    [bezierPath moveToPoint:CGPointMake(0, height/2)];
    
    [bezierPath addLineToPoint:CGPointMake(width, height/2)];
    
    _layer = [CAShapeLayer layer];
    
    _layer.path= bezierPath.CGPath;
    
    _layer.fillColor = [UIColor clearColor].CGColor;
    
    _layer.strokeEnd = 0;
    
    _layer.strokeColor = RGBA(33, 178, 123, 1).CGColor;
    
    _layer.lineWidth = height;//线宽
    
    _layer.lineCap = @"round";//圆角
    
    [self.layer addSublayer:_layer];
    
    self.layer.cornerRadius=  height/2;
    
    self.clipsToBounds = YES;
    
    self.backgroundColor = RGBA(216, 216, 216, 1);
}

-(void)setProcessValue:(float)processValue{
    
    _processValue= processValue;
    
    _layer.strokeEnd= processValue;
    
}

-(void)setFillColor:(UIColor*)fillColor{
    
    _fillColor= fillColor;
    
    _layer.strokeColor = _fillColor.CGColor;
    
}

-(void)setDefaultColor:(UIColor*)defaultColor{
    
    _defaultColor= defaultColor;
    
    self.backgroundColor= defaultColor;
    
}



@end

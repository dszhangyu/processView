//
//  ViewController.m
//  ZYProcessView
//
//  Created by dszhangyu on 2018/8/8.
//  Copyright © 2018年 dszhangyu. All rights reserved.
//

#import "ViewController.h"
#import "CircleProcessView.h"
#import "LineProcessView.h"

@interface ViewController ()
@property (strong , nonatomic)CircleProcessView * circleProcessView;
@property (strong , nonatomic)LineProcessView * lineProcessView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setupView];
}

-(void)setupView{
    [self.view addSubview:self.circleProcessView];
    [self.view addSubview:self.lineProcessView];
}

-(CircleProcessView *)circleProcessView{
    if (!_circleProcessView) {
        _circleProcessView = [[CircleProcessView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
        _circleProcessView.center = CGPointMake([UIScreen mainScreen].bounds.size.width / 2, 200);
    }
    return _circleProcessView;
}

-(LineProcessView *)lineProcessView{
    if (!_lineProcessView) {
        _lineProcessView = [[LineProcessView alloc]initWithFrame:CGRectMake(0, 0, 200, 30)];
        _lineProcessView.center = CGPointMake([UIScreen mainScreen].bounds.size.width / 2, 400);
    }
    return _lineProcessView;
}

- (IBAction)sliderChange:(UISlider * )sender {
    [self.circleProcessView setProcessViewValue:sender.value];
    self.lineProcessView.processValue = sender.value;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

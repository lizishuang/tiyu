//
//  MainViewController.m
//  tiyu
//
//  Created by 李爽 on 2019/3/5.
//  Copyright © 2019年 李爽. All rights reserved.
//

#import "MainViewController.h"
#import "HomeViewController.h"
#import "VideoViewController.h"
#import "WeatherViewController.h"
#import "MovementViewController.h"
#import "PersonViewController.h"
@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setTabar];
}

- (void)setTabar
{
    UIViewController *vc1 = [[HomeViewController alloc] init];
    vc1.view.backgroundColor = [UIColor redColor];
    vc1.title = @"首页";
    
    UIViewController *vc2 = [[VideoViewController alloc] init];
    vc2.view.backgroundColor = [UIColor redColor];
    vc2.title = @"视频";
    
    UIViewController *vc3 = [[WeatherViewController alloc] init];
    vc3.view.backgroundColor = [UIColor redColor];
    vc3.title = @"天气";
    
    UIViewController *vc4 = [[MovementViewController alloc] init];
    vc4.view.backgroundColor = [UIColor redColor];
    vc4.title = @"运动健身";
    
    UIViewController *vc5 = [[PersonViewController alloc] init];
    vc5.view.backgroundColor = [UIColor redColor];
    vc5.title = @"我的";
    
    self.viewControllers = @[vc1,vc2,vc3,vc4];
}



@end

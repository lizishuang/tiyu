//
//  PersonSetNameViewController.m
//  tiyu
//
//  Created by 李爽 on 2019/3/6.
//  Copyright © 2019年 李爽. All rights reserved.
//

#import "PersonSetNameViewController.h"

@interface PersonSetNameViewController ()

@end

@implementation PersonSetNameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self setNavState];
    [self setBackbutton];
    [self setSavebutton];
}

//设置导航栏
- (void)setNavState
{
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:215/256.0 green:30/256.0  blue:6/256.0  alpha:1];
    self.navigationController.navigationBar.translucent=NO;
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(0,0,80,15.5);
    label.numberOfLines = 0;
    self.navigationItem.titleView =label;
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@" 修改昵称" attributes:@{NSFontAttributeName: [UIFont fontWithName:@"PingFang-SC-Regular" size: 17],NSForegroundColorAttributeName: [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0]}];
    label.attributedText = string;
}

//设置返回键
-(void)setBackbutton
{
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(0, 0, 60, 30);
    [backButton setTitle:@"  Set" forState:UIControlStateNormal];
    [backButton setImage:[[UIImage imageNamed:@"back_btn"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
}

- (void)back
{
    [self.navigationController popViewControllerAnimated:NO];
}

//设置返回键
-(void)setSavebutton
{
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(0, 0, 60, 30);
    [backButton setTitle:@"  Save" forState:UIControlStateNormal];
    [backButton setImage:[[UIImage imageNamed:@"back_btn"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(Save) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
}

-(void)Save
{
    NSLog(@"保存成功");
}

@end

//
//  PersonViewController.m
//  tiyu
//
//  Created by 李爽 on 2019/3/5.
//  Copyright © 2019年 李爽. All rights reserved.
//

#import "PersonViewController.h"
#import "PersonSetViewController.h"

@interface PersonViewController ()
@property (weak, nonatomic) IBOutlet UIView *setImagview;
@property (weak, nonatomic) IBOutlet UIImageView *personMsgImageView;

@end

@implementation PersonViewController


//生命周期
- (void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBar.hidden =YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setImageViewAction];

}

- (void)viewWillDisappear:(BOOL)animated
{
    self.navigationController.navigationBar.hidden =NO;
}

- (void)setImageViewAction
{
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(pushSetingView)];
    [self.setImagview addGestureRecognizer:tap];
    
    UITapGestureRecognizer * tap2 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(pushPersonMsgView)];
    [self.personMsgImageView addGestureRecognizer:tap2];
}

//设置导航栏
- (void)setNavState
{
 self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:215/256.0 green:30/256.0  blue:6/256.0  alpha:1];
    self.navigationController.navigationBar.translucent=NO;
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(0,0,60,15.5);
    label.numberOfLines = 0;
    self.navigationItem.titleView =label;
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"  我的" attributes:@{NSFontAttributeName: [UIFont fontWithName:@"PingFang-SC-Regular" size: 17],NSForegroundColorAttributeName: [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0]}];
    label.attributedText = string;
}

// 隐藏导航栏分割线
-(void)hiddenNavLine
{
    UIView *backgroundView = [self.navigationController.navigationBar subviews].firstObject;
    for (UIView *view in backgroundView.subviews) {
        if (CGRectGetHeight([view frame]) <= 1) {
            
            view.hidden = YES;
        }
    }
}


-(void)pushSetingView{
    
    UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:[[PersonSetViewController alloc]init]];
    [self presentViewController:nav animated:NO completion:^{
        
    }];
}

-(void)pushPersonMsgView{
    
    
}

@end

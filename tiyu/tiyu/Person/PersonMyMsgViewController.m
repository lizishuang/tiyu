//
//  PersonMyMsgViewController.m
//  tiyu
//
//  Created by 李爽 on 2019/3/6.
//  Copyright © 2019年 李爽. All rights reserved.
//

#import "PersonMyMsgViewController.h"
#import "MyWindow.h"
#import "PersonSetNameViewController.h"

@interface PersonMyMsgViewController ()
@property (nonatomic,strong) UIView *tmpContentView;
@property (weak, nonatomic) IBOutlet UIView *headerImageViewTap;
@property (weak, nonatomic) IBOutlet UIView *SetNameTap;

@end

@implementation PersonMyMsgViewController
{
    MyWindow *customWindow;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self setNavState];
    [self setBackbutton];
    [self setTap];
}

//设置tap
- (void)setTap
{
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(headertap)];
    [self.headerImageViewTap addGestureRecognizer:tap];
    
    NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"MyWindow" owner:self options:nil];
    _tmpContentView = [nib objectAtIndex:0];
    UIButton * button1 = (UIButton    *)[_tmpContentView viewWithTag:1001];
    UIButton * button2 = (UIButton    *)[_tmpContentView viewWithTag:1002];
    [button1 addTarget:self action:@selector(paizhao) forControlEvents:UIControlEventTouchUpInside];
    [button2 addTarget:self action:@selector(xiangce) forControlEvents:UIControlEventTouchUpInside];
    
    UITapGestureRecognizer * tap2 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(SetName)];
    [self.SetNameTap addGestureRecognizer:tap2];
    
}

- (void)headertap
{
    customWindow = [[MyWindow alloc]initWithView:_tmpContentView];
    [customWindow show];
}

- (void)SetName
{
    PersonSetNameViewController * view  = [[PersonSetNameViewController alloc]init];
    [self.navigationController pushViewController:view animated:NO];
}

- (void)paizhao
{
    
}

- (void)xiangce
{
    
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
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@" 个人信息" attributes:@{NSFontAttributeName: [UIFont fontWithName:@"PingFang-SC-Regular" size: 17],NSForegroundColorAttributeName: [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0]}];
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
    [self dismissViewControllerAnimated:NO completion:^{
        
    }];
}
@end

//
//  PersonViewController.m
//  tiyu
//
//  Created by 李爽 on 2019/3/5.
//  Copyright © 2019年 李爽. All rights reserved.
//

#import "PersonViewController.h"
#import "PersonSetViewController.h"
#import "PersonMyMsgViewController.h"

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



-(void)pushSetingView{
    
    UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:[[PersonSetViewController alloc]init]];
    [self presentViewController:nav animated:NO completion:^{
        
    }];
}

-(void)pushPersonMsgView{
    
    UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:[[PersonMyMsgViewController alloc]init]];
    [self presentViewController:nav animated:NO completion:^{
        
    }];
    
}

@end

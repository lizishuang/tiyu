//
//  AppDelegate.m
//  tiyu
//
//  Created by 李爽 on 2019/3/5.
//  Copyright © 2019年 李爽. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"
#import "HomeViewController.h"
#import "VideoViewController.h"
#import "WeatherViewController.h"
#import "MovementViewController.h"
#import "PersonViewController.h"
#import <CYLTabBarController.h>

@interface AppDelegate ()

@property (nonatomic,strong )CYLTabBarController *atabBarController;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.atabBarController = [[CYLTabBarController alloc]init];
    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self setupViewControllers];
    [self.window setRootViewController:self.atabBarController] ;
  
    
    
    
    [self customizeInterface];
    [self.window makeKeyAndVisible];
    
    
    return YES;
}

- (void)setupViewControllers {
    HomeViewController *firstViewController = [[HomeViewController alloc] init];
    UIViewController *firstNavigationController = [[UINavigationController alloc]
                                                   initWithRootViewController:firstViewController];
    
    VideoViewController *secondViewController = [[VideoViewController alloc] init];
    UIViewController *secondNavigationController = [[UINavigationController alloc]
                                                    initWithRootViewController:secondViewController];
    
    WeatherViewController *threeViewController = [[WeatherViewController alloc] init];
    UIViewController * threeNavigationController = [[UINavigationController alloc]
                                                    initWithRootViewController:threeViewController];
    
    MovementViewController *fourViewController = [[MovementViewController alloc] init];
    UIViewController *fourNavigationController = [[UINavigationController alloc]
                                                    initWithRootViewController:fourViewController];
    
    PersonViewController *fiveViewController = [[PersonViewController alloc] init];
    UIViewController *fiveNavigationController = [[UINavigationController alloc]
                                                  initWithRootViewController:fiveViewController];
    
    CYLTabBarController *tabBarController = [[CYLTabBarController alloc] init];
   
    [self customizeTabBarForController :tabBarController];
    
    [tabBarController setViewControllers:@[
                                           firstNavigationController,
                                           secondNavigationController,
                                           threeNavigationController,
                                           fourNavigationController,
                                           fiveNavigationController,
                                           ]];
    self.atabBarController= tabBarController;
}


- (void)customizeTabBarForController:(CYLTabBarController *)tabBarController {
    
    NSDictionary *dict1 = @{
                            CYLTabBarItemTitle : @"首页",
                            CYLTabBarItemImage : @"home_normal",
                            CYLTabBarItemSelectedImage : @"home_highlight",
                            };
    NSDictionary *dict2 = @{
                            CYLTabBarItemTitle : @"视频",
                            CYLTabBarItemImage : @"mycity_normal",
                            CYLTabBarItemSelectedImage : @"mycity_highlight",
                            };
    
    NSDictionary *dict3 = @{
                            CYLTabBarItemTitle : @"天气",
                            CYLTabBarItemImage : @"mycity_normal",
                            CYLTabBarItemSelectedImage : @"mycity_highlight",
                            };
    
    NSDictionary *dict4 = @{
                            CYLTabBarItemTitle : @"运动健身",
                            CYLTabBarItemImage : @"mycity_normal",
                            CYLTabBarItemSelectedImage : @"mycity_highlight",
                            };
    
    NSDictionary *dict5 = @{
                            CYLTabBarItemTitle : @"我的",
                            CYLTabBarItemImage : @"mycity_normal",
                            CYLTabBarItemSelectedImage : @"mycity_highlight",
                            };
    
    NSArray *tabBarItemsAttributes = @[ dict1, dict2,dict3,dict4,dict5 ];
    tabBarController.tabBarItemsAttributes = tabBarItemsAttributes;
}

- (void)customizeInterface {
    
    // 普通状态下的文字属性
    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
    normalAttrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    
    // 选中状态下的文字属性
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
    
    // 设置文字属性
    UITabBarItem *tabBar = [UITabBarItem appearance];
    [tabBar setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    [tabBar setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    
    // 设置背景图片
    UITabBar *tabBarAppearance = [UITabBar appearance];
    [tabBarAppearance setBackgroundImage:[UIImage imageNamed:@"tabbar_background"]];
}



- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end

//
//  MyWindow.h
//  tiyu
//
//  Created by 李爽 on 2019/3/6.
//  Copyright © 2019年 李爽. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyWindow : UIWindow

{
    
    UIView *superView;
    UIView *backgroundView;
    UIImageView *backgroundImage;
    UIView *contentView;
    BOOL closed;
}

@property (nonatomic,retain) UIView *superView;
@property (nonatomic,retain) UIView *backgroundView;
@property (nonatomic,retain) UIImageView *backgroundImage;
@property (nonatomic,retain) UIView *contentView;

-(MyWindow *)initWithView:(UIView *)aView;
-(void)show;
-(void)close;

@end

NS_ASSUME_NONNULL_END

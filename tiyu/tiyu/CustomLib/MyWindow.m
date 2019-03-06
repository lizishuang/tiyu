//
//  MyWindow.m
//  tiyu
//
//  Created by 李爽 on 2019/3/6.
//  Copyright © 2019年 李爽. All rights reserved.
//

#import "MyWindow.h"

@implementation MyWindow

@synthesize superView;
@synthesize backgroundView;
@synthesize backgroundImage;
@synthesize contentView;

-(UIImage *) pngWithPath:(NSString *)path
{
    NSString *fileLocation = [[NSBundle mainBundle] pathForResource:path ofType:@"png"];
    NSData *imageData = [NSData dataWithContentsOfFile:fileLocation];
    UIImage *img=[UIImage imageWithData:imageData];
    return img;
}




-(MyWindow *)initWithView:(UIView *)windowView
{
    if (self=[super init]) {
        
        //内容view
        self.contentView = windowView;
        [self setFrame:CGRectMake(0, -64, [UIScreen mainScreen].bounds.size.width,[UIScreen mainScreen].bounds.size.height+64)];
        self.windowLevel = UIWindowLevelStatusBar;
        self.backgroundColor = [UIColor colorWithRed:130/256 green:131/256 blue:129/256 alpha:0.4];
        //添加根view，并且将背景设为透明.
        UIView *superview = [[UIView alloc] initWithFrame:[self bounds]];
        self.superView = superview;
        [superView setAlpha:0.0f];
        [self addSubview:superView];
        //设置background view.
        CGFloat offset = -6.0f;
        UIView *bv = [[UIView alloc] initWithFrame:CGRectInset(CGRectMake(0, 0, self.contentView.bounds.size.width, self.contentView.bounds.size.height), offset, offset)];
        self.backgroundView = bv;
        
        
        //用圆角png图片设为弹出窗口背景.
        UIImageView *bi = [[UIImageView alloc] initWithImage:[[self pngWithPath:@"alert_window_bg"]stretchableImageWithLeftCapWidth:13.0 topCapHeight:9.0]];
        self.backgroundImage = bi;
        [backgroundImage setFrame:[backgroundView bounds]];
        [backgroundView insertSubview:backgroundImage atIndex:0];
        
        [backgroundView setCenter:CGPointMake(superView.bounds.size.width/2, superView.bounds.size.height-(141/2))];
        [superView addSubview:backgroundView];
        
        CGRect frame = CGRectInset([backgroundView bounds], -1 * offset, -1 * offset);
        
        //显示内容view
        [backgroundView addSubview:self.contentView];
        [self.contentView setFrame:frame];
        
        closed = NO;
        
    }
    return self;
}

//显示弹出窗口
-(void)show
{
    [self makeKeyAndVisible];
    [superView setAlpha:1.0f];
}

-(void)dialogIsRemoved
{
    closed = YES;
    [contentView removeFromSuperview];
    contentView = nil;
    [backgroundView removeFromSuperview];
    backgroundView = nil;
    [superView removeFromSuperview];
    superView = nil;
    [self setAlpha:0.0f];
    [self removeFromSuperview];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if (closed==YES) {
        
    }else{
        [self close];
    }
}

-(void)close
{
    [UIView animateWithDuration:0.1 animations:^{
        [superView setAlpha:0.0f];
        [self dialogIsRemoved];
    }];
}
@end

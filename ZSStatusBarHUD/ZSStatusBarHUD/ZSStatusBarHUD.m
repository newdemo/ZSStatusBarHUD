//
//  ZSStatusBarHUD.m
//  VVeboZS
//
//  Created by @Zs on 15/12/12.
//  Copyright © 2015年 @Zs. All rights reserved.
//

#import "ZSStatusBarHUD.h"
#import <UIKit/UIKit.h>


@interface ZSStatusBarHUDBtn : UIButton
@property (weak,nonatomic) UIActivityIndicatorView *loadingView;

@end



static  const NSTimeInterval ZSStatusBarHUDDuration = 0.5;

@implementation ZSStatusBarHUD

static UIWindow *_window;
static ZSStatusBarHUDBtn *_btn;


/**
 *  初始参数
 */
+(void)initialize{
    _window = [[UIWindow alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 20)];
    //动画位移开始的高度
    _window.transform = CGAffineTransformMakeTranslation(0, -_window.frame.size.height);
    
    _window.backgroundColor = [UIColor blackColor];
    _window.alpha = 0.8;
    _window.windowLevel = UIWindowLevelAlert;
    
    _btn = [[ZSStatusBarHUDBtn alloc]init];
    _btn.titleLabel.font = [UIFont systemFontOfSize:13];
    _btn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [_btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _btn.frame = _window.bounds;
    [_window addSubview:_btn];
}


/**
 *  显示普通的信息
 *
 *  @param msg  msg
 */
+(void)showMsg:(NSString *)msg img:(NSString *)img{
    
    //如果窗口正在显示,就返回,禁止重复提交显示
    if (_window.hidden == NO && !_btn.loadingView.isAnimating) return;
    
    _window.hidden = NO;
    
    [_btn setTitle:msg forState:UIControlStateNormal];
    [_btn setImage:[UIImage imageNamed:img] forState:UIControlStateNormal];
    [_btn.loadingView stopAnimating];
    [UIView animateWithDuration:ZSStatusBarHUDDuration animations:^{
        _window.transform = CGAffineTransformIdentity;
    }completion:^(BOOL finished) {
        [UIView animateWithDuration:ZSStatusBarHUDDuration delay:1.0 options:UIViewAnimationOptionTransitionFlipFromBottom animations:^{
            //下移效果
//            _window.transform = CGAffineTransformMakeTranslation(0, 687);
            _window.transform = CGAffineTransformMakeTranslation(0, -20);
        } completion:^(BOOL finished) {
            _window.transform = CGAffineTransformMakeTranslation(0, -_window.frame.size.height);
            _window.hidden = YES;
        }];
    }];
    
}

/**
 *  显示成功信息
 *
 *  @param msg msg
 */
+(void)showSuccess:(NSString *)msg{

    [self showMsg:msg img:@"ZSStatusBarHUD.bundle/success"];
    
    
}
/**
 *  显示错误信息
 *
 *  @param msg msg
 */
+(void)showError:(NSString  *)msg{

    [self showMsg:msg img:@"ZSStatusBarHUD.bundle/error"];
    
}
/**
 *  显示正在加载的信息
 *
 *  @param msg msg
 */
+(void)showLoading:(NSString *)msg{

    //如果窗口正在显示,就返回,禁止重复提交显示
    if (_window.hidden == NO) return;
    
    //显示窗口
    _window.hidden = NO;

    //设置文字
    [_btn setTitle:msg forState:UIControlStateNormal];
    //清除图片
    [_btn setImage:nil forState:UIControlStateNormal];
    //显示加载的菊花
    [_btn.loadingView startAnimating];
    //动画
    [UIView animateWithDuration:ZSStatusBarHUDDuration animations:^{
        _window.transform = CGAffineTransformIdentity;
    }completion:nil];
    
}
/**
 *  隐藏正在加载的信息
 */
+(void)hideLoading{

    //动画
    [UIView animateWithDuration:ZSStatusBarHUDDuration animations:^{
        _window.transform = CGAffineTransformMakeTranslation(0, -_window.frame.size.height);
    }completion:^(BOOL finished) {
        //隐藏时关闭动画
        [_btn.loadingView stopAnimating];
        _window.hidden = YES;
    }];
}


@end





@implementation ZSStatusBarHUDBtn


/**
 *  加载中
 *
 *  @return
 */
-(UIActivityIndicatorView *)loadingView{

    if (!_loadingView) {
        UIActivityIndicatorView *loadingView = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
        loadingView.hidesWhenStopped  = YES;
        [self addSubview:loadingView];
        self.loadingView  = loadingView;
    }
    return _loadingView;
}



-(void)layoutSubviews{
    
    [super layoutSubviews];
    self.titleLabel.frame = self.bounds;
    //文字宽度
    CGFloat titleW = [[self titleForState:UIControlStateNormal] sizeWithAttributes:@{NSFontAttributeName :self.titleLabel.font}].width;
    //图片尺寸
    CGFloat imgWH = 15;
    CGFloat imgY = (self.frame.size.height - imgWH) * 0.5;
    CGFloat imgX = (self.frame.size.width - titleW) * 0.5 - imgWH -10;
    self.imageView.frame = CGRectMake(imgX, imgY, imgWH, imgWH);
    
    //设置加载的菊花的位置
    self.loadingView.center = self.imageView.center;
    
    
}

@end

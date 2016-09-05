//
//  ZSStatusBarHUD.h
//  VVeboZS
//
//  Created by @Zs on 15/12/12.
//  Copyright © 2015年 @Zs. All rights reserved.
//  状态栏指示器

#import <Foundation/Foundation.h>

@interface ZSStatusBarHUD : NSObject
/**
 *  显示普通的信息
 *
 *  @param msg 文字内容
 */
+(void)showMsg:(NSString *)msg img:(NSString *)img;
/**
 *  显示成功信息
 *
 *  @param msg 文字内容
 */
+(void)showSuccess:(NSString *)msg;
/**
 *  显示错误信息
 *
 *  @param msg 文字内容
 */
+(void)showError:(NSString  *)msg;
/**
 *  显示正在加载的信息
 *
 *  @param msg 文字内容
 */
+(void)showLoading:(NSString *)msg;
/**
 *  隐藏正在加载的信息
 */
+(void)hideLoading;
@end

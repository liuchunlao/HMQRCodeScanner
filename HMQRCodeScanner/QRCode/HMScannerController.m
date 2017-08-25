//
//  HMScannerController.m
//  HMQRCodeScanner
//
//  Created by 刘凡 on 16/1/2.
//  Copyright © 2016年 itheima. All rights reserved.
//

#import "HMScannerController.h"
#import "HMScannerViewController.h"
#import "HMScanner.h"

@implementation HMScannerController

+ (void)cardImageWithCardName:(NSString *)cardName avatar:(UIImage *)avatar scale:(CGFloat)scale completion:(void (^)(UIImage *))completion {
    [HMScanner qrImageWithString:cardName avatar:avatar scale:scale completion:completion];
}

+ (instancetype)scannerWithCardName:(NSString *)cardName avatar:(UIImage *)avatar completion:(void (^)(NSString *))completion {
    NSAssert(completion != nil, @"必须传入完成回调");
    
    return [[self alloc] initWithCardName:cardName avatar:avatar completion:completion];
}

- (instancetype)initWithCardName:(NSString *)cardName avatar:(UIImage *)avatar completion:(void (^)(NSString *))completion {
    self = [super init];
    if (self) {
        
        // 扫描控制器！HMScannerViewController
        HMScannerViewController *scanner = [[HMScannerViewController alloc] initWithCardName:cardName avatar:avatar completion:completion];
        
        [self setTitleColor:[UIColor whiteColor] tintColor:[UIColor greenColor]];
        
        [self pushViewController:scanner animated:NO];
    }
    return self;
}

- (void)setTitleColor:(UIColor *)titleColor tintColor:(UIColor *)tintColor {
    [self.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName: titleColor}];
    self.navigationBar.tintColor = tintColor;
}

// 支持方向-只支持正常方向！
- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

// 状态栏效果！
- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

@end

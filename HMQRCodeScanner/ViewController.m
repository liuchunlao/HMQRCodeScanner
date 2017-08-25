//
//  ViewController.m
//  HMQRCodeScanner
//
//  Created by 刘凡 on 16/1/2.
//  Copyright © 2016年 itheima. All rights reserved.
//

#import "ViewController.h"
#import "HMScannerController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *scanResultLabel;
@end

@implementation ViewController

// MARK: - 扫一扫
- (IBAction)clickScanButton:(id)sender {
    
    NSString *cardName = @"天涯刀哥 - 傅红雪";
    UIImage *avatar = [UIImage imageNamed:@"avatar"];
    
    // 扫描器！
    HMScannerController *scanner = [HMScannerController scannerWithCardName:cardName avatar:avatar completion:^(NSString *stringValue) {
        
        self.scanResultLabel.text = stringValue;
    }];
    
    // 修改标题颜色TitleColor 和 边框及扫描线颜色 tintColor
    [scanner setTitleColor:[UIColor whiteColor] tintColor:[UIColor greenColor]];
    
    // 显示扫描器 等效于 present！
    [self showDetailViewController:scanner sender:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *cardName = @"天涯刀哥 - 傅红雪";
    UIImage *avatar = [UIImage imageNamed:@"avatar"];
    
    [HMScannerController cardImageWithCardName:cardName avatar:avatar scale:0.2 completion:^(UIImage *image) {
        self.imageView.image = image;
    }];
}

@end

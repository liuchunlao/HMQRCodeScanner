//
//  HMScannerMaskView.m
//  HMQRCodeScanner
//
//  Created by 刘凡 on 16/1/3.
//  Copyright © 2016年 itheima. All rights reserved.
//

#import "HMScannerMaskView.h"

@implementation HMScannerMaskView

+ (instancetype)maskViewWithFrame:(CGRect)frame cropRect:(CGRect)cropRect {
    
    HMScannerMaskView *maskView = [[self alloc] initWithFrame:frame];
    
    maskView.backgroundColor = [UIColor clearColor];
    maskView.cropRect = cropRect;
    
    return maskView;
}

- (void)setCropRect:(CGRect)cropRect {
    _cropRect = cropRect;
    
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    
    // 1.获取图形上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 2.全屏填充颜色
    [[UIColor colorWithWhite:0.0 alpha:0.4] setFill];
    CGContextFillRect(ctx, rect);
    
    // 3.清除某片区域的填充效果！
    CGContextClearRect(ctx, self.cropRect);
    
    // 4.给清除的区域添加边界！
    [[UIColor colorWithWhite:0.95 alpha:1.0] setStroke];
    CGContextStrokeRectWithWidth(ctx, CGRectInset(_cropRect, 1, 1), 1);
}

@end

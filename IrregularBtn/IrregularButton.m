//
//  IrregularButton.m
//  IrregularBtn
//
//  Created by 张衡 on 2018/5/14.
//  Copyright © 2018年 老张. All rights reserved.
//

#import "IrregularButton.h"

@interface IrregularButton()

@property (nonatomic, strong) UIBezierPath *RMB19_Path;
@end

@interface IrregularButton()
@end

@implementation IrregularButton

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setlayout];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setlayout];
    }
    return self;
}

- (void)setlayout {
}

- (void)setCoordinatesArray:(NSArray *)coordinatesArray {
    _RMB19_Path = [UIBezierPath bezierPath];
    _RMB19_Path.lineWidth = 2.0;

    for (int i =0; i < coordinatesArray.count; i++) {
        NSArray  *arr    = coordinatesArray[i];
        NSString *xStr   = arr[0];
        NSString *yStr   = arr[1];
        CGFloat   x      = xStr.floatValue;
        CGFloat   y      = yStr.floatValue;
        if (i == 0) {
            [_RMB19_Path moveToPoint:CGPointMake(x, y)];
            continue;
        }
        [_RMB19_Path addLineToPoint:CGPointMake(x, y)];
    }
    [self setNeedsDisplay];

}

- (void)drawRect:(CGRect)rect{
    [[UIColor whiteColor] set];
    [_RMB19_Path stroke];
    [_RMB19_Path closePath];
    [_RMB19_Path fill];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = CGRectMake(0, 0, 110,50);
    maskLayer.path = _RMB19_Path.CGPath;
    self.layer.mask = maskLayer;
    self.layer.masksToBounds = NO;
}

- (void)dealloc {
    _RMB19_Path = nil;
}

@end


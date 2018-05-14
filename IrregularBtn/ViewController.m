//
//  ViewController.m
//  IrregularBtn
//
//  Created by 张衡 on 2018/5/14.
//  Copyright © 2018年 老张. All rights reserved.
//

#import "ViewController.h"
#import "IrregularButton.h"

#define HL_NavBarHeight (IS_IPHONEX ? 88 : 64)
#define IS_IPHONEX (([[UIScreen mainScreen] bounds].size.height-812)?NO:YES)
#define HL_Height (IS_IPHONEX ? ([[UIScreen mainScreen] bounds].size.height-34):([[UIScreen mainScreen] bounds].size.height))
#define HL_Width  [UIScreen mainScreen].bounds.size.width

typedef enum : NSInteger {
    type_RMB19 = 1,
    type_RMB59 = 2
}type_View;

@interface ViewController ()

@property (nonatomic, strong) IrregularButton *RMB19_btn;
@property (nonatomic, strong) IrregularButton *RMB59_btn;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"不规则按钮";
    [self setLayout];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)setLayout {

    UIColor *gray = [UIColor colorWithRed:215/255.f green:215/255.0f blue:215/255.f alpha:1.0];
    UIColor *red  = [UIColor redColor];
    UIColor *white= [UIColor whiteColor];
    // 19元征信
    _RMB19_btn = [[IrregularButton alloc] initWithFrame:CGRectMake(0, HL_NavBarHeight, 110, 50)];
    [_RMB19_btn setTitle:@"19元" forState:UIControlStateNormal];
    [_RMB19_btn setTitleColor:white forState:UIControlStateNormal];
    [_RMB19_btn setTitleColor:red  forState:UIControlStateSelected];
    [_RMB19_btn setBackgroundImage:[self createImageWithColor:gray] forState:UIControlStateNormal];
    [_RMB19_btn setBackgroundImage:[self createImageWithColor:white] forState:UIControlStateSelected];
    _RMB19_btn.selected = YES;

    [self.view addSubview:_RMB19_btn];
    _RMB19_btn.tag = type_RMB19;
    [_RMB19_btn addTarget:self action:@selector(chickRMB_Btn:) forControlEvents:UIControlEventTouchUpInside];

    // 59元征信
    _RMB59_btn = [[IrregularButton alloc] initWithFrame:CGRectMake(95, HL_NavBarHeight, HL_Width - 95, 50)];
    [_RMB59_btn setTitle:@"59元" forState:UIControlStateNormal];
    _RMB59_btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    _RMB59_btn.contentEdgeInsets = UIEdgeInsetsMake(0,30, 0, 0);
    [_RMB59_btn setTitleColor:white forState:UIControlStateNormal];
    [_RMB59_btn setTitleColor:red   forState:UIControlStateSelected];
    [_RMB59_btn setBackgroundImage:[self createImageWithColor:gray] forState:UIControlStateNormal];
    [_RMB59_btn setBackgroundImage:[self createImageWithColor:white] forState:UIControlStateSelected];

    [self.view addSubview:_RMB59_btn];
    _RMB59_btn.tag = type_RMB59;
    [_RMB59_btn addTarget:self action:@selector(chickRMB_Btn:) forControlEvents:UIControlEventTouchUpInside];
    [self setLayoutWithSelectRMB_btn19];
}

#pragma mark -------------------- setRMB_btnLayout(绘制坐标点) --------------------
- (void)setLayoutWithSelectRMB_btn19 {
    _RMB19_btn.coordinatesArray = @[@[@"0",@"0"],
                                    @[@"95",@"0"],
                                    @[@"110",@"50"],
                                    @[@"0",@"50"]];
    _RMB59_btn.coordinatesArray = @[@[@"0",@"0"],
                                    @[[NSString stringWithFormat:@"%.f",HL_Width - 95],@"0"],
                                    @[[NSString stringWithFormat:@"%.f",HL_Width - 95],@"50"],
                                    @[@"15",@"50"]];
}
- (void)setLayoutWithSelectRMB_btn59 {
    _RMB19_btn.coordinatesArray = @[@[@"0",@"0"],
                                    @[@"110",@"0"],
                                    @[@"95",@"50"],
                                    @[@"0",@"50"]];
    _RMB59_btn.coordinatesArray = @[@[@"15",@"0"],
                                    @[[NSString stringWithFormat:@"%.f",HL_Width - 95],@"0"],
                                    @[[NSString stringWithFormat:@"%.f",HL_Width - 95],@"50"],
                                    @[@"0",@"50"]];
}

#pragma mark -------------------- 19元与59元按钮切换点击事件 --------------------
- (void)chickRMB_Btn:(UIButton *)btn {
    if (btn.tag == type_RMB19) {
        _RMB59_btn.selected = NO;
        _RMB19_btn.selected = YES;
        [self setLayoutWithSelectRMB_btn19];
    } else if (btn.tag == type_RMB59) {
        _RMB19_btn.selected = NO;
        _RMB59_btn.selected = YES;
        [self setLayoutWithSelectRMB_btn59];
    }
}

#pragma mark -------------------- 颜色转化为图片 --------------------
-(UIImage*) createImageWithColor:(UIColor*) color
{
    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

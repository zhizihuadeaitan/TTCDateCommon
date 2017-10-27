//
//  ViewController.m
//  TTCDateCommonDemo
//
//  Created by TT_Cindy on 2017/10/27.
//  Copyright © 2017年 TT_Cindy. All rights reserved.
//

#import "ViewController.h"
#import "TTCDateCommon.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    // 日期Date转换字符串
    NSString *dateStr = [TTCDateCommon TTC_datetimeConversionAndDatetimeWithDate:[NSDate date] datePrecision:DatePrecision_Date];//精确到日DatePrecision 日期精度
    NSString *hourStr = [TTCDateCommon TTC_datetimeConversionAndDatetimeWithDate:[NSDate date] datePrecision:DatePrecision_Hour];//精确到时DatePrecision 日期精度
    DLog(@"%@",dateStr);
    DLog(@"%@",hourStr);
    
    
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

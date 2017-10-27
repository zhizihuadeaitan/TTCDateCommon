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
    NSString *dateStr = [TTCDateCommon TTC_datetimeConversionAndDatetimeWithDate:[NSDate date] datePrecision:DatePrecision_Date dateStyle:DateStyle_Slash];//精确到日DatePrecision 日期精度,dateStyle:/-.三种
    NSString *hourStr = [TTCDateCommon TTC_datetimeConversionAndDatetimeWithDate:[NSDate date] datePrecision:DatePrecision_Hour dateStyle:DateStyle_Slash];//精确到时DatePrecision 日期精度,dateStyle:/-.三种
    DLog(@"%@",dateStr);
    DLog(@"%@",hourStr);
    
    //比较两个日期大小
    NSComparisonResult resutl = [TTCDateCommon TTC_compareDateStrA:@"2016/01/12" WithDateStrB:@"2017/01/12" datePrecision:DatePrecision_Date dateStyle:DateStyle_Slash];
    switch (resutl) {
        case NSOrderedAscending:
        {
            NSLog(@"a<b");
        }
            break;
        case NSOrderedSame:
        {
            NSLog(@"a=b");
            
        }
            break;
        case NSOrderedDescending:
        {
            NSLog(@"a>b");
            
        }
            break;
            
        default:
            break;
    }
    NSArray *arr =  [TTCDateCommon TTC_getMonthBeginAndEndWith:@"2017/1/1" datePrecision:DatePrecision_Date dateStyle:DateStyle_Slash];
    NSArray *arr1 =  [TTCDateCommon TTC_getMonthBeginAndEndWith:@"2017/2" datePrecision:DatePrecision_Month dateStyle:DateStyle_Slash];
    NSLog(@"%@",arr);
    NSLog(@"%@",arr1);
    
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

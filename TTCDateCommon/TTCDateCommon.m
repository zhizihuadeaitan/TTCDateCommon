//
//  NSDateCommon.m
//  we
//
//  Created by TTCindy on 15/7/9.
//  Copyright (c) 2015年 TTCindy. All rights reserved.
//
#import "TTCDateCommon.h"

@implementation TTCDateCommon

/*
 存放常用的日期转换类
 注意保持代码的优美性！
 */


#pragma mark -单独取日期中的年月日请在这里面找
//0==>只取年月，1==>只取年月日，2==>取小时
+ (NSString *)TTC_dateTimeConvertYearMonth:(NSDate *)date datePrecision:(DatePrecision)datePrecision dateStyle:(DateStyle)dateStyle
{
    NSString *styles = [[NSString alloc]init];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    styles = [self datePrecision:datePrecision dateStyle:dateStyle];
    
    switch (datePrecision) {
        case 0:
            styles = @"yyyy-MM";
            break;
        case 1:
            styles = @"yyyy-MM-dd";
            break;
        case 2:
            styles = @"yyyy";
            break;
        case 3:
            styles = @"MM";
            break;
        case 4:
            styles = @"dd";
            break;
        case 5:
            styles = @"HH";
            break;
        case 6:
            styles = @"HH:mm";
            break;
            
        default:
            [dateFormatter setTimeStyle:NSDateFormatterShortStyle];
            styles  = @"mm";
            break;
    }
    [dateFormatter setDateFormat:styles];
    NSString *oneDayStr = [dateFormatter stringFromDate:date];
    return oneDayStr;
}

#pragma mark -其它待分类
//时间戳转换字符串
+ (NSString *)TTC_datetimeConversionAndDatetime:(int)datetime datePrecision:(DatePrecision)datePrecision dateStyle:(DateStyle)dateStyle
{
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:datetime];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:[self datePrecision:datePrecision dateStyle:dateStyle]]; // -----
    NSString *nowtimeStr = [formatter stringFromDate:confromTimesp];
    return nowtimeStr;
}


//字符串转为NSDate
+ (NSDate*)TTC_datetimeConversionAndDatetimeStr:(NSString *)dateStr datePrecision:(DatePrecision)datePrecision dateStyle:(DateStyle)dateStyle
{
    //    dateStr = @"2015-1-23 22:32:32";
    
    //将传入时间转化成需要的格式
    NSDateFormatter *format=[[NSDateFormatter alloc] init];
    //    [format setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    [format setDateFormat:[self datePrecision:datePrecision dateStyle:dateStyle]];
    
    NSDate *fromdate=[format dateFromString:dateStr];
    NSTimeZone *fromzone = [NSTimeZone systemTimeZone];
    NSInteger frominterval = [fromzone secondsFromGMTForDate: fromdate];
    NSDate *fromDate = [fromdate  dateByAddingTimeInterval: frominterval];
    //    DLog(@"fromdate====%@",fromDate);
    return fromDate;
}

//输入日期转换周几
+ (NSString *)TTC_getWeek:(NSDate *)date
{
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSDateComponents *weekdayComponents =
    [gregorian components:NSCalendarUnitWeekday fromDate:date];
    int _weekday = (int)[weekdayComponents weekday];
    DLog(@"_weekday::%d",_weekday - 1);
    switch (_weekday - 1) {
        case 0:
            return @"星期日";
            break;
        case 1:
            return @"星期一";
            break;
        case 2:
            return @"星期二";
            break;
        case 3:
            return @"星期三";
            break;
        case 4:
            return @"星期四";
            break;
        case 5:
            return @"星期五";
            break;
        case 6:
            return @"星期六";
            break;
        default:
            break;
    }
    return 0;
    
}
+ (NSString *)dateStyle:(DateStyle)dateStyle
{
    NSString *dateStyleStr;
    switch (dateStyle) {
        case DateStyle_Slash:
        {
            dateStyleStr = @"/";
        }
            break;
        case DatePrecision_Bridge:
        {
            dateStyleStr = @"-";
            
        }
            break;
        case DatePrecision_Spot:
        {
            dateStyleStr = @".";
            
        }
            break;
            
        default:
            break;
    }
    return dateStyleStr;
}
+ (NSString *)datePrecision:(DatePrecision)datePrecision dateStyle:(DateStyle)dateStyle
{
    NSString *dateStyleStr = [self dateStyle:dateStyle];
    NSString *precisionStr;
    
    switch (datePrecision) {
        case DatePrecision_Year:
        {
            precisionStr = @"yyyy";
            
        }
            break;
        case DatePrecision_Month:
        {
            precisionStr = [NSString stringWithFormat:@"yyyy%@MM",dateStyleStr];
            
        }
            break;
            
        case DatePrecision_Date:
        {
            precisionStr = [NSString stringWithFormat:@"yyyy%@MM%@dd",dateStyleStr,dateStyleStr];
            
        }
            break;
        case DatePrecision_Hour:
        {
            precisionStr = [NSString stringWithFormat:@"yyyy%@MM%@dd HH",dateStyleStr,dateStyleStr];
            
            
        }
            break;
        case DatePrecision_Minutes:
        {
            precisionStr = [NSString stringWithFormat:@"yyyy%@MM%@dd HH:mm",dateStyleStr,dateStyleStr];
            
        }
            break;
        case DatePrecision_Seconds:
        {
            precisionStr = [NSString stringWithFormat:@"yyyy%@MM%@dd HH:mm:ss",dateStyleStr,dateStyleStr];
            
            
        }
            break;
        case DatePrecision_Ms:
        {
            precisionStr = [NSString stringWithFormat:@"yyyy%@MM%@dd HH:mm:ss:SSS",dateStyleStr,dateStyleStr];
            
        }
            break;
            case DatePrecision_OnlyMonth:
        {
            precisionStr = @"MM";

        }
            break;
       
        case DatePrecision_OnlyDate:
        {
            precisionStr = @"dd";

        }
            break;
        case DatePrecision_OnlyHour:
        {
            precisionStr = @"HH";

       
        }
            break;
        case DatePrecision_OnlyMinutes:
        {
            precisionStr = @"mm";

        }
            break;
        case DatePrecision_OnlySeconds:
        {
            precisionStr = @"ss";

        }
            break;
        case DatePrecision_OnlyMs:
        {
            precisionStr = @"SSS";

        }
            break;
        default:
            break;
    }
    return precisionStr;
}
+ (NSInteger )TTC_spacingDateWithDateA:(NSDate *)dateA andDateB:(NSDate *)dateB datePrecision:(DatePrecision)datePrecision
{
    
    //判断某时间跟现在相差多少天
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay
                                               fromDate:dateA toDate:dateB options:0];
    int year = (int)[components year];//相差年数
    int month = (int)[components month];//相差月数
    int day = (int)[components day];//相差天数
    int hour = (int)[components hour];//相差小时
    int minute = (int)[components minute];//相差分
    int second = (int)[components second];//相差秒
    int ms = (int)[components nanosecond];//相差毫秒
    
    NSInteger spacing = 0;
    switch (datePrecision) {
        case DatePrecision_Year:
        {
            spacing = year;
        }
            break;
        case DatePrecision_Month:
        {
            spacing = month;
            
        }
            break;
        case DatePrecision_Date:
        {
            spacing = day;
            
            
        }
            break;
        case DatePrecision_Hour:
        {
            spacing = hour;
            
        }
            break;
        case DatePrecision_Minutes:
        {
            spacing = minute;
            
        }
            break;
        case DatePrecision_Seconds:
        {
            spacing = second;
        }
            break;
        case DatePrecision_Ms:
        {
            spacing = ms;
            
        }
            break;
        default:
            spacing = ms;

            break;
    }
    
    return spacing;
}



+ (NSString *)TTC_lastOrNextMonthWith:(NSDateComponents *)cmp andSpan:(int)span
                              datePrecision:(DatePrecision)datePrecision dateStyle:(DateStyle)dateStyle
{
    NSCalendar *calender = [NSCalendar currentCalendar];//获取NSCalender单例。
    //    NSDateComponents *cmp = [calender components:(NSMonthCalendarUnit | NSYearCalendarUnit) fromDate:date]; //设置属性，因为我只需要年和月，这个属性还可以支持时，分，秒。
    DLog(@"%ld",(long)[cmp month]);
    switch (datePrecision) {
        case DatePrecision_Month:
            [cmp setMonth:[cmp month] - span];//设置上个月，即在现有的基础上减去一个月。这个地方可以灵活的支持跨年了，免去了繁琐的计算年份的工作。
            
            break;
            
        default:
        {
            [cmp setMonth:[cmp month] + span];//设置上个月，即在现有的基础上减去一个月。这个地方可以灵活的支持跨年了，免去了繁琐的计算年份的工作。
        }
            break;
    }
    NSDate *lastMonDate = [calender dateFromComponents:cmp];//拿到上个月的NSDate，再用NSDateFormatter就可以拿到单独的年和月了。
    return [self TTC_dateTimeConvertYearMonth:lastMonDate datePrecision:DatePrecision_Month dateStyle:dateStyle];
}

+ (NSComparisonResult)TTC_compareDateStrA:(NSString *)dateA WithDateStrB:(NSString *)dateB datePrecision:(DatePrecision)datePrecision dateStyle:(DateStyle)dateStyle
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:[self datePrecision:DatePrecision_Date dateStyle:DateStyle_Slash]];
    NSDate *dateC = [dateFormatter dateFromString:dateA];
    NSDate *dateD = [dateFormatter dateFromString:dateB];
    NSComparisonResult resultt = [dateC compare:dateD];
    return resultt;
}

//判断日期在某个区间之内
+ (BOOL)TTC_isBetweenFromHour:(NSInteger)fromHour FromMinute:(NSInteger)fromMin toHour:(NSInteger)toHour toMinute:(NSInteger)toMin{
    NSDate *date8 = [self TTC_getCustomDateWithHour:fromHour andMinute:fromMin];
    NSDate *date23 = [self TTC_getCustomDateWithHour:toHour andMinute:toMin];
    NSDate *currentDate = [NSDate date];
    if ([currentDate compare:date8]==NSOrderedDescending && [currentDate compare:date23]==NSOrderedAscending)
    {
        DLog(@"该时间在 %ld:%ld-%ld:%ld 之间！", fromHour, fromMin, toHour, toMin);
        return YES;
    }
    else
        
        return NO;
    
}

//传入的小时和分钟，转成nsdate类型
+ (NSDate *)TTC_getCustomDateWithHour:(NSInteger)hour andMinute:(NSInteger)minute{
    //获取当前时间
    NSDate *currentDate = [NSDate date];
    NSCalendar *currentCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *currentComps = [[NSDateComponents alloc] init];        NSInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    currentComps = [currentCalendar components:unitFlags fromDate:currentDate];
    //设置当天的某个点
    NSDateComponents *resultComps = [[NSDateComponents alloc] init];    [resultComps setYear:[currentComps year]];
    [resultComps setMonth:[currentComps month]];
    [resultComps setDay:[currentComps day]];
    [resultComps setHour:hour];
    [resultComps setMinute:minute];
    NSCalendar *resultCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    return [resultCalendar dateFromComponents:resultComps];
}
+ (NSArray *)TTC_getMonthBeginAndEndWith:(NSString *)dateStr datePrecision:(DatePrecision)datePrecision dateStyle:(DateStyle)dateStyle
{
    NSString *dateStyleStr = [self datePrecision:datePrecision dateStyle:dateStyle];

    NSDateFormatter *format=[[NSDateFormatter alloc] init];
    [format setDateFormat:dateStyleStr];
    NSDate *newDate=[format dateFromString:dateStr];
    double interval = 0;
    NSDate *beginDate = nil;
    NSDate *endDate = nil;
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    [calendar setFirstWeekday:2];//设定周一为周首日
    BOOL ok = [calendar rangeOfUnit:NSCalendarUnitMonth startDate:&beginDate interval:&interval forDate:newDate];
    //分别修改为 NSDayCalendarUnit NSWeekCalendarUnit NSYearCalendarUnit
    if (ok) {
        endDate = [beginDate dateByAddingTimeInterval:interval-1];
    }else {
        return @[@"",@""];
    }
    NSDateFormatter *myDateFormatter = [[NSDateFormatter alloc] init];
    [myDateFormatter setDateFormat:[NSString stringWithFormat:@"yyyy%@MM%@dd",[self dateStyle:dateStyle],[self dateStyle:dateStyle]]];
    NSString *beginString = [myDateFormatter stringFromDate:beginDate];
    NSString *endString = [myDateFormatter stringFromDate:endDate];
    return @[beginString, endString];
}
+ (NSString *)TTC_datetimeConversionAndDatetimeWithDate:(NSDate *)date datePrecision:(DatePrecision)datePrecision dateStyle:(DateStyle)dateStyle
{
    
    NSDate *  senddate = date;
    
    NSDateFormatter  *dateformatter=[[NSDateFormatter alloc] init];
    
    [dateformatter setDateFormat:[self datePrecision:datePrecision dateStyle:dateStyle]];
    
    NSString *  locationString=[dateformatter stringFromDate:senddate];
    NSLog(@"日期：%@",locationString);
    return locationString;
}





@end

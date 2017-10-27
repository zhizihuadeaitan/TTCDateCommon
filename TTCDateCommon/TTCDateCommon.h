//
//  NSDateCommon.h
//  we
//
//  Created by TTCindy on 15/7/9.
//  Copyright (c) 2015年 TTCindy. All rights reserved.
//

#import <Foundation/Foundation.h>
//---------------------打印日志--------------------------
//Debug模式下打印日志,当前行,函数名
#if DEBUG
#define DLog(FORMAT, ...) fprintf(stderr,"\nfunction:%s line:%d content:%s\n", __FUNCTION__, __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);

#else
#define DLog(FORMAT, ...) nil
#endif

@interface TTCDateCommon : NSObject
typedef NS_ENUM(NSInteger, DatePrecision) {
    //以下是枚举成员
    DatePrecision_Year = 0,//精确到年
    DatePrecision_Month = 1,//精确到月
    DatePrecision_Date = 2,//精确到日
    DatePrecision_Hour = 3,//精确到时
    DatePrecision_Minutes= 4,//精确到分
    DatePrecision_Seconds= 5,//精确到秒
    DatePrecision_Ms= 6,//精确到毫秒
    DatePrecision_OnlyMonth = 7,//只取月份
    DatePrecision_OnlyDate = 8,//只取日
    DatePrecision_OnlyHour = 9,//只取时
    DatePrecision_OnlyMinutes= 10,//只取分
    DatePrecision_OnlySeconds= 11,//只取秒
    DatePrecision_OnlyMs= 12,//只取毫秒
    
};
typedef NS_ENUM(NSInteger, DateStyle) {
    //以下是枚举成员
    DateStyle_Slash = 0,//斜杠 2017/01/11
    DatePrecision_Bridge = 1,//杠 2017-01-11
    DatePrecision_Spot = 2,//点  2017.01.11
};

/**
 *  比较两个日期的大小,仅支持年月日
 *
 *  @param dateA  第一个日期
 *  @param dateB  第二个日期
 *  @param datePrecision 精度
 *  @param dateStyle 风格
 *  @return 大小
 */
+ (NSComparisonResult)TTC_compareDateStrA:(NSString *)dateA WithDateStrB:(NSString *)dateB datePrecision:(DatePrecision)datePrecision dateStyle:(DateStyle)dateStyle;
/**
 *  当前日期的上月或下月
 *
 *  @param cmp  当前日期
 *  @param span 时间戳
 *  @param datePrecision 精度
 *  @param dateStyle 风格
 
 *  @return 大小
 */
//上月或下月
+ (NSString *)TTC_lastOrNextMonthWith:(NSDateComponents *)cmp andSpan:(int)span datePrecision:(DatePrecision)datePrecision dateStyle:(DateStyle)dateStyle;

/**
 *  单独取日期中的年月日
 *
 *  @param date 日期
 *  @param datePrecision 精度
 *  @param dateStyle 风格
 
 *  @return 大小
 */
+ (NSString *)TTC_dateTimeConvertYearMonth:(NSDate *)date datePrecision:(DatePrecision)datePrecision dateStyle:(DateStyle)dateStyle;

/**
 *  字符串转为NSDate
 *
 *  @param dateStr 日期字符串
 *  @param datePrecision 精度
 *  @return 日期date
 */
+ (NSDate*)TTC_datetimeConversionAndDatetimeStr:(NSString *)dateStr datePrecision:(DatePrecision)datePrecision dateStyle:(DateStyle)dateStyle;

/**
 *  某月的第一天和最后一天
 *  @param dateStr 日期字符串
 *  @return 返回某月第一天和最后一天
 */
+ (NSArray *)TTC_getMonthBeginAndEndWith:(NSString *)dateStr datePrecision:(DatePrecision)datePrecision dateStyle:(DateStyle)dateStyle;


/**
 *  时间戳转换字符串
 *
 *  @param datetime 时间戳
 *  @param datePrecision 精度
 *  @return 日期Str
 */
+ (NSString *)TTC_datetimeConversionAndDatetime:(int)datetime datePrecision:(DatePrecision)datePrecision dateStyle:(DateStyle)dateStyle;

/**
 *  日期Date转换字符串
 *
 *  @param date 日期
 *  @param datePrecision 精度
 *  @return 日期Str
 */
+ (NSString *)TTC_datetimeConversionAndDatetimeWithDate:(NSDate *)date datePrecision:(DatePrecision)datePrecision dateStyle:(DateStyle)dateStyle;

/**
 *  判断时间A和时间B相差多久，只支持年、月、日、时、分、秒
 *
 *  @param dateA 时间A
 *  @param dateB 时间B
 *  @param datePrecision 精度
 
 *  @return 时间间隔
 */
+ (NSInteger)TTC_spacingDateWithDateA:(NSDate *)dateA andDateB:(NSDate *)dateB datePrecision:(DatePrecision)datePrecision dateStyle:(DateStyle)dateStyle;
/**
 *  获取时间戳
 *
 *  @param date 日期
 *  @return 时间戳str
 */
//+ (NSString *)getTimeStamp:(NSDate *)date;
@end

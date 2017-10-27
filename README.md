# TTCDateCommon
### 所有日期相关的方法。
#### 用法：

``` // 日期Date转换字符串
NSString *dateStr = [TTCDateCommon TTC_datetimeConversionAndDatetimeWithDate:[NSDate date] datePrecision:DatePrecision_Date];//精确到日DatePrecision 日期精度
NSString *hourStr = [TTCDateCommon TTC_datetimeConversionAndDatetimeWithDate:[NSDate date] datePrecision:DatePrecision_Hour];//精确到时DatePrecision 日期精度
DLog(@"%@",dateStr);
DLog(@"%@",hourStr);
```

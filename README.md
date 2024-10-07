#import <Foundation/Foundation.h>

- (double)timeDifferenceBetween:(NSString *)timeString1 and:(NSString *)timeString2 withFormat:(NSString *)format {
    // 创建一个日期格式器
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:format]; // 例如 @"yyyy-MM-dd HH:mm:ss"
    
    // 将时间字符串转换为 NSDate
    NSDate *date1 = [dateFormatter dateFromString:timeString1];
    NSDate *date2 = [dateFormatter dateFromString:timeString2];
    
    if (date1 == nil || date2 == nil) {
        NSLog(@"Error parsing one of the time strings.");
        return -1; // 错误情况，返回 -1
    }
    
    // 计算两个时间之间的时间差（秒）
    NSTimeInterval timeInterval = [date2 timeIntervalSinceDate:date1];
    
    // 返回时间差（秒），如果你需要以其他单位返回（例如分钟或小时），可以对结果做进一步处理
    return timeInterval;
}
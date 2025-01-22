#import <Foundation/Foundation.h>

NSString *calculateTotalTime(NSString *time1, NSString *time2, NSString *additionalTime) {
    // 创建日期格式化器
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyy-MM-dd-HH-mm-ss";
    
    // 将时间字符串转换为 NSDate 对象
    NSDate *date1 = [dateFormatter dateFromString:time1];
    NSDate *date2 = [dateFormatter dateFromString:time2];
    
    if (!date1 || !date2) {
        return @"Invalid date format";
    }
    
    // 计算两个时间的差值（秒数）
    NSTimeInterval timeDifference = fabs([date1 timeIntervalSinceDate:date2]);
    
    // 将 additionalTime 转换为秒数
    NSArray<NSString *> *components = [additionalTime componentsSeparatedByString:@" "];
    NSTimeInterval additionalSeconds = 0;
    for (NSInteger i = 0; i < components.count; i += 2) {
        NSInteger value = [components[i] integerValue];
        NSString *unit = components[i + 1];
        
        if ([unit containsString:@"hr"]) {
            additionalSeconds += value * 3600; // 小时转换为秒
        } else if ([unit containsString:@"min"]) {
            additionalSeconds += value * 60; // 分钟转换为秒
        }
    }
    
    // 总时间差
    NSTimeInterval totalSeconds = timeDifference + additionalSeconds;
    
    // 转换总时间差为字符串格式
    NSInteger hours = totalSeconds / 3600;
    NSInteger minutes = ((NSInteger)totalSeconds % 3600) / 60;
    
    NSMutableString *result = [NSMutableString string];
    if (hours > 0) {
        [result appendFormat:@"%ld hr%s", (long)hours, hours > 1 ? "s" : ""];
    }
    if (minutes > 0) {
        if (hours > 0) {
            [result appendString:@" "];
        }
        [result appendFormat:@"%ld min%s", (long)minutes, minutes > 1 ? "s" : ""];
    }
    if ([result length] == 0) {
        [result appendString:@"Less than 1 min"];
    }
    
    return result;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *time1 = @"2025-01-22-12-00-00";
        NSString *time2 = @"2025-01-22-13-30-00";
        NSString *additionalTime = @"1 hr 23 mins";
        
        NSString *result = calculateTotalTime(time1, time2, additionalTime);
        NSLog(@"%@", result); // 输出：2 hrs 53 mins
    }
    return 0;
}
+ (BOOL)isTargetTime:(NSString *)targetTime 
        betweenStart:(NSString *)startTime 
              andEnd:(NSString *)endTime 
          timeDiffInHours:(double *)hoursDiff {
    // 创建时间格式化器
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    // 解析开始和结束时间
    formatter.dateFormat = @"yyyy_MM_dd_HH_mm_ss";
    NSDate *startDate = [formatter dateFromString:startTime];
    NSDate *endDate = [formatter dateFromString:endTime];
    
    // 解析目标时间
    formatter.dateFormat = @"yyyy-MM-dd-HH-mm-ss-SSS";
    NSDate *targetDate = [formatter dateFromString:targetTime];
    
    if (!startDate || !endDate || !targetDate) {
        NSLog(@"时间格式不正确");
        return NO;
    }
    
    // 判断是否在时间区间内
    BOOL isInRange = ([targetDate compare:startDate] != NSOrderedAscending &&
                      [targetDate compare:endDate] != NSOrderedDescending);
    
    // 计算时间差（以小时为单位）
    if (hoursDiff != NULL) {
        NSTimeInterval timeInterval = [endDate timeIntervalSinceDate:startDate];
        *hoursDiff = timeInterval / 3600.0; // 秒转小时
    }
    
    return isInRange;
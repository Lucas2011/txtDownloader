int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *startTime = @"2024_12_04_11_11_12";
        NSString *endTime = @"2024_12_04_13_11_12";
        NSString *targetTime = @"2024-12-04-11-24-03-000";
        
        double hoursDiff = 0.0;
        BOOL isInRange = [TimeUtils isTargetTime:targetTime 
                                    betweenStart:startTime 
                                          andEnd:endTime 
                                  timeDiffInHours:&hoursDiff];
        
        if (isInRange) {
            NSLog(@"目标时间在开始和结束时间之间");
        } else {
            NSLog(@"目标时间不在范围内");
        }
        
        NSLog(@"开始时间和结束时间之间的时间差为: %.2f 小时", hoursDiff);
    }
    return 0;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *startTime = @"2024_12_04_11_11_12";
        NSString *endTime = @"2024_12_04_13_11_12";
        NSString *targetTime = @"2024-12-04-11-24-03-000";
        
        double hoursDiff = 0.0;
        BOOL isInRange = [TimeUtils isTargetTime:targetTime 
                                    betweenStart:startTime 
                                          andEnd:endTime 
                                  timeDiffInHours:&hoursDiff];
        
        if (isInRange) {
            NSLog(@"目标时间在开始和结束时间之间");
        } else {
            NSLog(@"目标时间不在范围内");
        }
        
        NSLog(@"开始时间和结束时间之间的时间差为: %.2f 小时", hoursDiff);
    }
    return 0;
}
NSString *isoDateString = @"2025-04-11T03:45:10.779718Z";
    NSRange dotRange = [isoDateString rangeOfString:@"."];
    
    if (dotRange.location != NSNotFound) {
        isoDateString = [isoDateString substringToIndex:dotRange.location];
    }
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ss";
    formatter.timeZone = [NSTimeZone timeZoneWithAbbreviation:@"UTC"];
    NSDate *parsedDate = [formatter dateFromString:isoDateString];
    if (parsedDate) {
        NSDate *now = [NSDate date];
        NSTimeInterval timeDiff = fabs([now timeIntervalSinceDate:parsedDate]);
        NSInteger roundedTimeDiff = (NSInteger)ceil(timeDiff);
        NSLog(@"Time difference in seconds: %ld", roundedTimeDiff);
    }
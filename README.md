- (void)retryUpdateresultWithMaxRetries:(NSInteger)maxRetries completionHandler:(void (^)(NSError *error))completionHandler {
    __block NSInteger retryCount = 0;  // 当前重试次数
    
    void (^retryBlock)(NSError *) = ^(NSError *error) {
        if (!error || retryCount >= maxRetries) {
            // 如果没有错误或达到最大重试次数，调用完成处理器并退出
            if (completionHandler) {
                completionHandler(error);
            }
        } else {
            // 增加重试次数并再次调用 updateresultWithcompletionhandler
            retryCount++;
            NSLog(@"Retrying... Attempt #%ld", (long)retryCount);
            
            // 再次调用方法，并将 retryBlock 作为回调传入
            [self updateresultWithcompletionhandler:retryBlock];
        }
    };
    
    // 初始调用
    [self updateresultWithcompletionhandler:retryBlock];
}
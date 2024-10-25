typedef void (^CompletionHandler)(NSError *error);

- (void)performOperationWithMaxRetries:(NSInteger)maxRetries
                            operation:(void (^)(CompletionHandler completion))operation
                    completionHandler:(CompletionHandler)completionHandler {

    __block NSInteger currentRetryCount = 0;

    void (^retryableCompletionHandler)(NSError *) = ^(NSError *error) {
        if (error && currentRetryCount < maxRetries) {
            currentRetryCount++;
            NSLog(@"Retrying... Attempt %ld", (long)currentRetryCount);
            // 重新调用操作
            operation(retryableCompletionHandler);
        } else {
            // 达到最大重试次数或成功，调用最终的 completionHandler
            completionHandler(error);
        }
    };

    // 首次执行操作
    operation(retryableCompletionHandler);
}

[self performOperationWithMaxRetries:3
                          operation:^(CompletionHandler completion) {
                              [test updateResultWithCompletionHandler:completion];
                          }
                  completionHandler:^(NSError *error) {
                      if (error) {
                          NSLog(@"Operation failed after retries with error: %@", error.localizedDescription);
                      } else {
                          NSLog(@"Operation succeeded.");
                      }
                  }];
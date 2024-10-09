
//

- (void)runCommandWithRetry:(NSInteger)maxRetries delay:(NSTimeInterval)delay command:(BOOL (^)(void))command {
    [self runCommandWithAttempt:0 maxRetries:maxRetries delay:delay command:command];
}

- (void)runCommandWithAttempt:(NSInteger)attempt maxRetries:(NSInteger)maxRetries delay:(NSTimeInterval)delay command:(BOOL (^)(void))command {
    BOOL success = command();

    if (!success && attempt < maxRetries) {
        NSLog(@"Attempt %ld failed, retrying in %.2f seconds...", (long)attempt + 1, delay);
        // Sleep for the given delay (in seconds)
        [NSThread sleepForTimeInterval:delay];
        // Retry
        [self runCommandWithAttempt:attempt + 1 maxRetries:maxRetries delay:delay command:command];
    } else if (!success) {
        NSLog(@"Command failed after %ld attempts.", (long)maxRetries);
    } else {
        NSLog(@"Command succeeded on attempt %ld.", (long)attempt + 1);
    }
}
- (void)runCommandWithRetry:(NSInteger)maxRetries delay:(NSTimeInterval)delay {
    [self runCommandWithAttempt:0 maxRetries:maxRetries delay:delay];
}

- (void)runCommandWithAttempt:(NSInteger)attempt maxRetries:(NSInteger)maxRetries delay:(NSTimeInterval)delay {
    BOOL success = [self runCommand]; // Replace with your actual command

    if (!success && attempt < maxRetries) {
        NSLog(@"Attempt %ld failed, retrying in %.2f seconds...", (long)attempt + 1, delay);
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delay * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self runCommandWithAttempt:attempt + 1 maxRetries:maxRetries delay:delay];
        });
    } else if (!success) {
        NSLog(@"Command failed after %ld attempts.", (long)maxRetries);
    } else {
        NSLog(@"Command succeeded on attempt %ld.", (long)attempt + 1);
    }
}

- (BOOL)runCommand {
    // Your actual command logic here
    // Return YES if it succeeds, NO if it fails
    return arc4random_uniform(2); // Example: randomly succeeds or fails
}
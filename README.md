NSString *filePath = @"文件路径";
NSInputStream *inputStream = [NSInputStream inputStreamWithFileAtPath:filePath];
[inputStream open];

NSMutableString *fileContents = [NSMutableString string];
NSUInteger bufferSize = 1024;
uint8_t buffer[bufferSize];

while ([inputStream hasBytesAvailable]) {
    NSInteger bytesRead = [inputStream read:buffer maxLength:bufferSize];
    if (bytesRead > 0) {
        NSString *chunk = [[NSString alloc] initWithBytes:buffer length:bytesRead encoding:NSUTF8StringEncoding];
        if (chunk) {
            [fileContents appendString:chunk];
        } else {
            NSLog(@"Error: Could not decode chunk.");
            // Handle decoding error as needed
        }
    }
}

[inputStream close];

NSArray *lines = [fileContents componentsSeparatedByString:@"\n"];
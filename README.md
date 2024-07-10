NSString *filePath = @"path_to_your_file";
NSInputStream *inputStream = [NSInputStream inputStreamWithFileAtPath:filePath];
[inputStream open];

NSMutableString *fileContents = [NSMutableString string];
NSUInteger bufferSize = 1024; // Adjust the buffer size as per your requirement
uint8_t buffer[bufferSize];

while ([inputStream hasBytesAvailable]) {
    NSInteger bytesRead = [inputStream read:buffer maxLength:bufferSize];
    if (bytesRead > 0) {
        NSString *chunk = [[NSString alloc] initWithBytes:buffer length:bytesRead encoding:NSUTF8StringEncoding];
        [fileContents appendString:chunk];
    }
}

[inputStream close];

NSArray *lines = [fileContents componentsSeparatedByString:@"\n"];
NSString *filePath = @"path_to_your_file";
NSInputStream *inputStream = [NSInputStream inputStreamWithFileAtPath:filePath];
[inputStream open];

NSMutableArray *lines = [NSMutableArray array];
NSMutableString *currentLine = [NSMutableString string];

while ([inputStream hasBytesAvailable]) {
    uint8_t buffer[1024]; // Adjust the buffer size as per your requirement
    NSInteger bytesRead = [inputStream read:buffer maxLength:sizeof(buffer)];
    if (bytesRead > 0) {
        for (NSInteger i = 0; i < bytesRead; i++) {
            char character = buffer[i];
            if (character == '\n') {
                [lines addObject:[currentLine stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]];
                [currentLine setString:@""];
            } else {
                [currentLine appendFormat:@"%c", character];
            }
        }
    }
}

// Add the last line if any
if (currentLine.length > 0) {
    [lines addObject:[currentLine stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]];
}

[inputStream close];
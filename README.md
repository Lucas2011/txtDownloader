NSString *filePath = @"path_to_your_file";
NSFileHandle *fileHandle = [NSFileHandle fileHandleForReadingAtPath:filePath];
if (fileHandle == nil) {
    NSLog(@"Failed to open file");
    return;
}

NSMutableString *fileContents = [NSMutableString string];
NSData *lineSeparator = [@"\n" dataUsingEncoding:NSUTF8StringEncoding];

while (YES) {
    NSData *lineData = [fileHandle readDataUpToData:lineSeparator
                                        withTimeout:0
                                              error:nil];
    if (lineData.length == 0) {
        break;
    }
    NSString *lineString = [[NSString alloc] initWithData:lineData
                                                 encoding:NSUTF8StringEncoding];
    [fileContents appendString:lineString];
    [fileContents appendString:@"\n"];
}

[fileHandle closeFile];

NSArray *lines = [fileContents componentsSeparatedByString:@"\n"];
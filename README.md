
#import <Foundation/Foundation.h>

- (void)moveTestFilesFromDirectory:(NSString *)sourceDir toDirectory:(NSString *)destinationDir {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error = nil;
    
    // 获取源目录中的所有文件
    NSArray *files = [fileManager contentsOfDirectoryAtPath:sourceDir error:&error];
    
    if (error) {
        NSLog(@"Error reading directory: %@", error.localizedDescription);
        return;
    }

    // 遍历文件并移动以 "test" 开头的文件
    for (NSString *file in files) {
        if ([file hasPrefix:@"test"]) {
            NSString *sourcePath = [sourceDir stringByAppendingPathComponent:file];
            NSString *destinationPath = [destinationDir stringByAppendingPathComponent:file];
            
            // 移动文件
            BOOL success = [fileManager moveItemAtPath:sourcePath toPath:destinationPath error:&error];
            
            if (success) {
                NSLog(@"Moved file: %@", file);
            } else {
                NSLog(@"Error moving file: %@", error.localizedDescription);
            }
        }
    }
}
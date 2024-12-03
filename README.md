#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // 获取当前目录
        NSString *currentDirectory = [[NSFileManager defaultManager] currentDirectoryPath];
        
        // 需要压缩的目录列表
        NSArray *directoriesToCompress = @[@"user/lin/lulu/Job/testa", @"user/lin/lulu/Job/testb"];
        
        // 构建 tar 命令
        NSString *tarFileName = @"test.tar";
        NSMutableArray *arguments = [NSMutableArray arrayWithObject:@"-cf"];  // -c 用于创建归档，-f 用于指定归档文件
        [arguments addObject:tarFileName];
        
        // 使用 -C 选项切换到 Job 目录的上级目录（即 lulu）
        [arguments addObject:@"user/lin/lulu"];
        
        // 添加 testa 和 testb 目录（不包括完整路径）
        [arguments addObject:@"Job/testa"];
        [arguments addObject:@"Job/testb"];
        
        // 创建 NSTask
        NSTask *task = [[NSTask alloc] init];
        [task setLaunchPath:@"/usr/bin/tar"];
        [task setArguments:arguments];
        [task setCurrentDirectoryPath:currentDirectory];
        
        // 执行任务
        [task launch];
        [task waitUntilExit];
        
        if (task.terminationStatus == 0) {
            NSLog(@"压缩成功：%@", tarFileName);
        } else {
            NSLog(@"压缩失败！");
        }
    }
    return 0;
}
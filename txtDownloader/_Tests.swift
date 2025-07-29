- (void)runMultipleFTPCurlTasks:(NSArray<NSString *> *)ftpURLs {
    dispatch_group_t group = dispatch_group_create();
    NSDate *startTime = [NSDate date];

    for (NSString *ftpURL in ftpURLs) {
        dispatch_group_enter(group);

        NSTask *task = [[NSTask alloc] init];
        task.launchPath = @"/usr/bin/curl";

        // 使用三层超时保护参数
        task.arguments = @[
            @"--no-buffer",             // 实时输出
            @"--connect-timeout", @"10",// TCP连接超时保护
            @"--max-time", @"30",       // 总体任务超时保护
            ftpURL
        ];

        NSPipe *pipe = [NSPipe pipe];
        NSFileHandle *fileHandle = pipe.fileHandleForReading;
        task.standardOutput = pipe;
        task.standardError = pipe;

        NSLog(@"[%.2fs] 🚀 启动任务: %@", [[NSDate date] timeIntervalSinceDate:startTime], ftpURL);

        // 实时监听输出
        __block id observer = [[NSNotificationCenter defaultCenter] addObserverForName:NSFileHandleReadCompletionNotification
                                                                                object:fileHandle
                                                                                 queue:[NSOperationQueue mainQueue]
                                                                            usingBlock:^(NSNotification *note) {
            NSData *data = note.userInfo[NSFileHandleNotificationDataItem];
            if (data.length > 0) {
                NSString *output = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                NSTimeInterval elapsed = [[NSDate date] timeIntervalSinceDate:startTime];
                NSLog(@"[%@][%.2fs] %@", ftpURL, elapsed, output);

                // 继续监听
                [fileHandle readInBackgroundAndNotify];
            } else {
                [[NSNotificationCenter defaultCenter] removeObserver:observer];
            }
        }];

        // 启动任务
        [task launch];
        [fileHandle readInBackgroundAndNotify];

        // terminationHandler：确保 dispatch_group_leave 被调用
        task.terminationHandler = ^(NSTask *terminatedTask) {
            NSTimeInterval elapsed = [[NSDate date] timeIntervalSinceDate:startTime];
            NSLog(@"[%@][%.2fs] ✅ 任务结束，退出码: %d", ftpURL, elapsed, terminatedTask.terminationStatus);
            dispatch_group_leave(group);
        };

        // 第三层超时保护（硬中断 curl）
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(40 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            if ([task isRunning]) {
                NSTimeInterval elapsed = [[NSDate date] timeIntervalSinceDate:startTime];
                NSLog(@"[%@][%.2fs] ⚠️ 超时强制终止任务", ftpURL, elapsed);
                [task terminate];
            }
        });
    }

    // 所有任务完成后统一处理
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        NSTimeInterval total = [[NSDate date] timeIntervalSinceDate:startTime];
        NSLog(@"🎉 所有 FTP 下载任务完成，总耗时：%.2fs", total);
        [self doNextStepAfterAllFTPDownloads];
    });
}

// 示例后续逻辑方法
- (void)doNextStepAfterAllFTPDownloads {
    NSLog(@"✅ 进入后续处理逻辑，例如合并数据、通知用户等");
}

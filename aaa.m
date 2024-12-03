//
//  ViewController.m
//  task
//
//  Created by Lucas on 12/2/24.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) NSTask *task;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self compressTestFiles];
}

- (void)compressTestFiles {
    NSString *workingDir = @"/Users/lucas/Desktop/00000";
    
    // 创建 shell 任务
    self.task = [[NSTask alloc] init];
    self.task.launchPath = @"/bin/sh";
    self.task.currentDirectoryPath = workingDir;
    
    // 创建 shell 命令：使用 -C 选项指定工作目录
    NSString *command = @"tar -czf test.tar -C /Users/lucas/Desktop/00000 test*.log";
    self.task.arguments = @[@"-c", command];
    
    // 设置输出管道
    NSPipe *pipe = [NSPipe pipe];
    self.task.standardError = pipe;
    self.task.standardOutput = pipe;
    
    self.task.terminationHandler = ^(NSTask *task) {
        NSFileHandle *fileHandle = [pipe fileHandleForReading];
        NSData *data = [fileHandle readDataToEndOfFile];
        NSString *output = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            if (task.terminationStatus != 0) {
                NSLog(@"压缩失败，退出码: %d", task.terminationStatus);
                NSLog(@"输出信息: %@", output);
            } else {
                NSLog(@"压缩成功完成");
                
                // 创建解压任务来测试
                NSTask *untar = [[NSTask alloc] init];
                untar.launchPath = @"/usr/bin/tar";
                untar.arguments = @[@"-xf", @"test.tar"];
                untar.currentDirectoryPath = workingDir;
                
                NSError *untarError;
                [untar launchAndReturnError:&untarError];
                if (untarError) {
                    NSLog(@"解压测试失败: %@", untarError);
                }
            }
        });
    };
    
    NSError *error;
    
    // 启动任务
    [self.task launchAndReturnError:&error];
    if (error) {
        NSLog(@"启动任务失败: %@", error);
    }
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


@end

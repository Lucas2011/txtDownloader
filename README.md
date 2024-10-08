#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // 创建 NSTask 实例
        NSTask *task = [[NSTask alloc] init];
        
        // 设置要执行的命令
        task.launchPath = @"/usr/bin/find";
        
        // 设置命令的参数
        task.arguments = @[@"/Users/lucas/Desktop/0-test", @"-maxdepth", @"1", @"-name", @"bb*", @"!", @"-name", @"bb", @"-exec", @"mv", @"{}", @"/Users/lucas/Desktop/0-test/bb/", @";"];
        
        // 创建一个用于接收命令输出的管道
        NSPipe *pipe = [NSPipe pipe];
        task.standardOutput = pipe;
        
        // 启动任务
        [task launch];
        [task waitUntilExit];
        
        // 获取输出
        NSFileHandle *file = [pipe fileHandleForReading];
        NSData *data = [file readDataToEndOfFile];
        NSString *output = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        
        // 打印输出
        NSLog(@"Command output: %@", output);
    }
    return 0;
}
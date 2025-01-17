#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // 输入字符串
        NSString *inputString = @"a/b9927627/2024-11-12-13-15-333/2024-11-12-13-15-333-test/2024-11-12-13-15-333.json";
        
        // 定义正则表达式，匹配 yyyy-mm-dd-hh-mm-sss 格式
        NSString *pattern = @"\\d{4}-\\d{2}-\\d{2}-\\d{2}-\\d{2}-\\d{3}";
        
        // 创建正则表达式对象
        NSError *error = nil;
        NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:pattern options:0 error:&error];
        
        if (error) {
            NSLog(@"正则表达式创建失败: %@", error.localizedDescription);
            return 1;
        }
        
        // 匹配输入字符串
        NSArray<NSTextCheckingResult *> *matches = [regex matchesInString:inputString options:0 range:NSMakeRange(0, inputString.length)];
        
        // 提取匹配结果
        NSMutableArray<NSString *> *resultArray = [NSMutableArray array];
        for (NSTextCheckingResult *match in matches) {
            NSRange matchRange = [match range];
            NSString *matchedString = [inputString substringWithRange:matchRange];
            [resultArray addObject:matchedString];
        }
        
        // 输出匹配结果
        NSLog(@"提取的日期时间字符串: %@", resultArray);
    }
    return 0;
}
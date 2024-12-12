#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // 假设 dfOutput 是通过 `df -h /` 获取的结果
        NSString *dfOutput = @"Filesystem      Size   Used  Avail Capacity  Mounted on\n/dev/disk1s5s1  500Gi  300Gi  200Gi    60%          /";
        
        // 将字符串按行分割
        NSArray<NSString *> *lines = [dfOutput componentsSeparatedByString:@"\n"];
        if (lines.count < 2) {
            NSLog(@"无法解析: 数据不足");
            return 1;
        }
        
        // 获取第二行
        NSString *secondLine = lines[1];
        
        // 按空格分割第二行
        NSCharacterSet *whitespaceSet = [NSCharacterSet whitespaceCharacterSet];
        NSArray<NSString *> *columns = [secondLine componentsSeparatedByCharactersInSet:whitespaceSet];
        columns = [columns filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"length > 0"]]; // 去除空字符串
        
        if (columns.count < 5) {
            NSLog(@"无法解析: 数据格式不正确");
            return 1;
        }
        
        // 获取 Size 和 Avail
        NSString *sizeString = columns[1];
        NSString *availString = columns[3];
        
        // 去掉单位，转成浮点数
        double size = [[sizeString stringByReplacingOccurrencesOfString:@"Gi" withString:@""] doubleValue];
        double avail = [[availString stringByReplacingOccurrencesOfString:@"Gi" withString:@""] doubleValue];
        
        if (size == 0) {
            NSLog(@"无法计算: Size 为 0");
            return 1;
        }
        
        // 计算可用百分比
        double freePercentage = (avail / size) * 100.0;
        NSLog(@"Free: %.2f%%", freePercentage);
    }
    return 0;
}
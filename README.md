#import <Foundation/Foundation.h>

@interface SafeMutableDictionary : NSMutableDictionary

@end

@implementation SafeMutableDictionary

- (void)setValue:(id)value forKey:(NSString *)key {
    if (key == nil || [key isEqualToString:@""]) {
        // 如果 key 为 nil 或空字符串，发送通知
        [[NSNotificationCenter defaultCenter] postNotificationName:@"KeyIsNilNotification"
                                                            object:self
                                                          userInfo:@{@"key": @"nil or empty"}];
        return;
    }
    
    if (value == nil) {
        // 如果 value 为 nil，发送通知
        [[NSNotificationCenter defaultCenter] postNotificationName:@"ValueIsNilNotification"
                                                            object:self
                                                          userInfo:@{@"key": key}];
        return;
    }
    
    // 正常设置值
    [super setValue:value forKey:key];
}

// 必须重写以下方法以确保 NSMutableDictionary 的子类正常工作
- (id)objectForKey:(id)aKey {
    return [super objectForKey:aKey];
}

- (NSUInteger)count {
    return [super count];
}

- (NSEnumerator *)keyEnumerator {
    return [super keyEnumerator];
}

@end
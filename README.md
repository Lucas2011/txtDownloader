#import <Foundation/Foundation.h>

NSString *extractIPAddress(NSString *input, BOOL withPrefix) {
    if (!input || input.length == 0) {
        return nil;
    }

    NSError *error = nil;
    // 使用正则匹配 IP:PORT
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"(\\d{1,3}(?:\\.\\d{1,3}){3}:\\d+)"
                                                                           options:0
                                                                             error:&error];

    NSTextCheckingResult *match = [regex firstMatchInString:input options:0 range:NSMakeRange(0, input.length)];

    if (match && match.range.location != NSNotFound) {
        NSString *ipPort = [input substringWithRange:match.range];
        if (withPrefix) {
            return [NSString stringWithFormat:@"http://%@/", ipPort];
        } else {
            return ipPort;
        }
    }

    return nil; // 如果没匹配上，就返回 nil
}
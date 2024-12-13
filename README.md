import Foundation

/// 从输入字符串中提取时间字符串
/// - Parameter input: 输入的字符串
/// - Returns: 提取到的时间字符串或 `nil`
func extractTimeString(from input: String) -> String? {
    // 匹配日期时间的正则表达式
    let pattern = #"\d{4}-\d{2}-\d{2} \d{2}-\d{2}-\d{2}"#
    
    // 创建正则表达式对象
    guard let regex = try? NSRegularExpression(pattern: pattern) else {
        print("正则表达式无效")
        return nil
    }
    
    // 搜索匹配结果
    let range = NSRange(location: 0, length: input.utf16.count)
    if let match = regex.firstMatch(in: input, options: [], range: range),
       let matchedRange = Range(match.range, in: input) {
        // 提取匹配的时间字符串
        let matchedString = String(input[matchedRange])
        return matchedString
    }
    
    print("未匹配到任何时间")
    return nil
}

// 示例调用
let inputString = "日志时间是：2023-11-11 11-11-11，其他信息跟在后面。"
if let timeString = extractTimeString(from: inputString) {
    print("提取到的时间字符串：\(timeString)")
} else {
    print("未能提取到时间字符串")
}
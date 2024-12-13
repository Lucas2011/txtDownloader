import Foundation

// 输入字符串
let inputString = "日志时间是：2023-11-11 11-11-11，其他信息跟在后面。"

// 匹配日期时间的正则表达式
let pattern = #"\d{4}-\d{2}-\d{2} \d{2}-\d{2}-\d{2}"#

if let regex = try? NSRegularExpression(pattern: pattern) {
    // 搜索匹配结果
    let range = NSRange(location: 0, length: inputString.utf16.count)
    if let match = regex.firstMatch(in: inputString, options: [], range: range) {
        if let matchedRange = Range(match.range, in: inputString) {
            let matchedString = String(inputString[matchedRange])
            
            // 将时间字符串转换为标准格式
            let standardTimeString = matchedString.replacingOccurrences(of: "-", with: ":", options: .literal, range: matchedString.range(of: " ")!)
            
            // 使用 DateFormatter 解析为 Date
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            if let date = dateFormatter.date(from: standardTimeString) {
                let timestamp = date.timeIntervalSince1970
                print("匹配到的时间戳：\(timestamp)")
            } else {
                print("时间格式转换失败")
            }
        }
    } else {
        print("未匹配到任何时间")
    }
} else {
    print("正则表达式无效")
}
import Foundation

// 输入字符串
let stringA = "1234567 djgxheyeheh 12/12/2011 555 55556666666 Eugene Eugene /12/12 2862626"
let stringB = "55556666666 another text 8888888 random 2862626"

// 正则匹配连续 7 位及以上的数字
func extractNumbers(from text: String) -> Set<String> {
    let pattern = "\\d{7,}"  // 匹配7位及以上的连续数字
    guard let regex = try? NSRegularExpression(pattern: pattern) else { return [] }
    
    let matches = regex.matches(in: text, range: NSRange(text.startIndex..., in: text))
    
    var result = Set<String>()
    for match in matches {
        if let range = Range(match.range, in: text) {
            result.insert(String(text[range]))
        }
    }
    return result
}

// 提取A和B的数字集合
let numbersA = extractNumbers(from: stringA)
let numbersB = extractNumbers(from: stringB)

// 交叉对比，移除重复的数字
let uniqueNumbersA = numbersA.subtracting(numbersB)

print("提取的数字（去重后）：", uniqueNumbersA)
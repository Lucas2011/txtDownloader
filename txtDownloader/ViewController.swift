//
//  ViewController.swift
//  txtDownloader
//
//  Created by Lucas on 10/19/23.
//

import Cocoa
import SwiftSoup

class ViewController: NSViewController,NSTextFieldDelegate{
    
    @IBOutlet weak var displayLabelURL: NSTextField!
    @IBOutlet weak var textFieldChapterIndex: NSTextField!
    @IBOutlet weak var textFieldURL: NSTextField!
    
    @IBOutlet weak var textFieldExportPath: NSTextField!
    let fileName = "txtDownloader_book.txt"
    var filePath = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
     
        
        setUIContents()
    }
    
    func setUIContents (){
        
        textFieldURL.delegate = self;
        textFieldChapterIndex.delegate = self;
        textFieldExportPath.delegate = self;

        textFieldURL.placeholderString = "URL\nhttps://651.bqgdi.com/html/95239/"
        displayLabelURL.maximumNumberOfLines = 0
        }
    
    func updateURLAddres (urlStr:String){
        DispatchQueue.main.async {
            self.displayLabelURL.stringValue = urlStr
        }
    }
    
    
    // MARK: - Download
    
    func downloadURL(url:String, chapter:Int) {
        var chapter = chapter
        // 1. 定义要抓取的多个网页的 URL 列表
        var bookRetryCount = 0
        var preContent = ""
        var totalRetryTime = 0
        
        
        while (bookRetryCount < 9){
            
            var chapterRetryCount = 0
            var pages = 2
            var urlCombin = ""
                        
            while (chapterRetryCount < 6) {
                
                
                if chapterRetryCount == 0
                {
                    urlCombin = url + "\(chapter).html"
                }else{
                    urlCombin = url + "\(chapter)_\(pages).html"
                    pages += 1
                }
                updateURLAddres(urlStr: urlCombin)
                
                let issucessed = writeDownURLContentToPath(urlStr: urlCombin, preContents: &preContent, totalRetryTime:&totalRetryTime)
                if (issucessed == false) {break}
                chapterRetryCount += 1
            }
            
            chapter += 1
            
            Thread.sleep(forTimeInterval: 0.1)
            bookRetryCount += 1
            
            if (totalRetryTime > 5) {
                print("Done")
                break
            }
            
        }
        
    }
    
    
    func writeDownURLContentToPath(urlStr:String!, preContents:inout String , totalRetryTime:inout Int) -> Bool{
        
        do {
            
            let url = URL.init(string: urlStr)!
            let html = try String(contentsOf: url)
            
            // 3. 使用 SwiftSoup 解析网页
            let doc = try SwiftSoup.parse(html)
            
            // 4. 提取网页文本
            var text = try doc.text()
            
            text = removeBeforeMatchedStr(text: text, pattern: "下一章 ")
            text = removeAfereMatchedStr(text: text, pattern: "请收藏")
            if text.count < 200 {return false}
            text = text + "\n\n"
            if (preContents == text) {
                totalRetryTime += 1
                return false
            }else{
                totalRetryTime = 0
            }
            
            preContents = text
            // 5. 创建文本文件并将文本写入其中
            
            if let fileHandle = FileHandle(forWritingAtPath: filePath) {
                fileHandle.seekToEndOfFile()
                fileHandle.write(text.data(using: .utf8) ?? Data())
                fileHandle.closeFile()
                print("网页文本已成功追加到文件：\(url)")
            } else {
                print("无法打开文件以追加文本：\(url)")
            }
            
            
            return true
        } catch {
            print("出现错误：\(error)")
            return false
            
        }
    }
    
    
    // MARK: - Button Action
    
    @IBAction func buttonClicked(_ sender: NSButton) {
        let urlStr = self.textFieldURL.stringValue
        
        sender.title = "Processing"
        sender.isEnabled = false
        
        FileManager.default.createFile(atPath: filePath, contents: nil, attributes: nil)
        
        guard let chapter = textFieldChapterIndex.stringValue.count > 1 ? Int(textFieldChapterIndex.stringValue) : 1 else {return}
        
        DispatchQueue.global().async {
            
            self.downloadURL(url: urlStr, chapter: chapter)
            
            DispatchQueue.main.async {
                sender.isEnabled = true
                sender.title = "Go"
            }
            
        }
    }
    
    
    @IBAction func deleteFileClicked(_ sender: NSButton) {
        
        
        if FileManager.default.fileExists(atPath: filePath) == false {return}
        
        sender.isEnabled = false
        
        do {
            try FileManager.default.removeItem(atPath: filePath)
            sender.title = "✅"
            print("文件删除成功")
        } catch {
            sender.title = "❌"
            print("删除文件时出错: \(error)")
        }
        
        DispatchQueue.global().async {
            
            Thread.sleep(forTimeInterval: 1)
            
            DispatchQueue.main.async {
                sender.isEnabled = true
                sender.title = "Delete File"
            }
        }
        
    }
    
    // MARK: - NSTextFiled Delegate
    
    
    func containsOnlyDigits(_ input: String) -> Bool {
        for character in input {
            if !character.isNumber {
                return false
            }
        }
        return true
    }
    
    
    func controlTextDidChange(_ obj: Notification) {
        guard let textField = obj.object as? NSTextField  else {return }
        
        let chapter = textFieldChapterIndex.stringValue.count > 1 ? Int(textFieldChapterIndex.stringValue) : 1
        let urlStr = "URL:" + self.textFieldURL.stringValue + "\(chapter!).html"
        
        let exportPath = (textFieldExportPath.stringValue.hasSuffix("/") ? textFieldExportPath.stringValue : textFieldExportPath.stringValue + "/") + fileName
        filePath = exportPath
        updateURLAddres(urlStr: urlStr + "\n" + "Export File Path:" + exportPath)
        
        
        
        switch textField.tag {
        case 2:
            if  containsOnlyDigits(textField.stringValue) ==  false {
                textField.stringValue = ""
            }
        default:
            break
        }
    }
 
    
    // MARK: - Mached String Modify
    
    func removeBeforeMatchedStr (text:String, pattern:String) -> String{
        var  text = text
        if let range = text.range(of: pattern, options: .caseInsensitive) {
            
            let endIndex = range.upperBound
            
            text.removeSubrange(text.startIndex..<endIndex)
            
        }
        return text
        
    }
    
    func removeAfereMatchedStr (text:String, pattern:String) -> String{
        var  text = text
        if let range = text.range(of: pattern, options: .caseInsensitive) {
            // 找到第一个匹配位置的上界
            let startIndex = range.lowerBound
            // 使用前缀截断字符串，删除匹配位置及其后面的字符
            text = String(text.prefix(upTo: startIndex))
        }
        return text
    }
    
    
    
}


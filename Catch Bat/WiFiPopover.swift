//
//  WiFiPopover.swift
//  Catch Bat
//
//  Created by 梁怀宇 on 2020/4/4.
//  Copyright © 2020 lhy. All rights reserved.
//

import Foundation
import Cocoa

class WiFiPopoverSubview: NSView, NSTextFieldDelegate{
    var view: NSView?
    var passwdLabel: NSTextView?
    static var passwdInputBox: NSTextField?
    var passwdInputBoxCell: NSTextFieldCell?
    static var passwdInputBox1: NSSecureTextField?
    var isShowPasswd: NSButton?
    var isSave:NSButton?
    
    override init(frame: NSRect) {
        super.init(frame: frame)
        view = NSView(frame: NSRect(x: 0, y: 0, width: 300, height: 80))
        passwdLabel = NSTextView(frame: NSRect(x: 0, y: 59, width: 100, height: 21))
        WiFiPopoverSubview.passwdInputBox = NSTextField(frame: NSRect(x: 45, y: 59, width: 255, height: 21))
        passwdInputBoxCell = NSTextFieldCell.init()
        WiFiPopoverSubview.passwdInputBox1 = NSSecureTextField(frame: NSRect(x: 45, y: 59, width: 255, height: 21))
        isShowPasswd = NSButton(frame: NSRect(x: 43, y: 35, width: 100, height: 18))
        isSave = NSButton(frame: NSRect(x: 43, y: 15, width: 100, height: 18))
        
        passwdLabel?.string = "密码："
        passwdLabel?.drawsBackground = false
        passwdLabel?.isEditable = false
        passwdLabel?.isSelectable = false
        passwdLabel?.font = NSFont.systemFont(ofSize: 13)
        view?.addSubview(passwdLabel!)
        
        WiFiPopoverSubview.passwdInputBox?.cell = passwdInputBoxCell
        passwdInputBoxCell?.allowedInputSourceLocales = [NSAllRomanInputSourcesLocaleIdentifier]
        passwdInputBoxCell?.isBordered = true
        WiFiPopoverSubview.passwdInputBox?.stringValue = ""
        WiFiPopoverSubview.passwdInputBox?.drawsBackground = true
        WiFiPopoverSubview.passwdInputBox?.isEditable = true
        WiFiPopoverSubview.passwdInputBox?.isSelectable = true
        WiFiPopoverSubview.passwdInputBox?.font = NSFont.systemFont(ofSize: 13)
        WiFiPopoverSubview.passwdInputBox?.delegate = self
        WiFiPopoverSubview.passwdInputBox?.isHidden = true
        //passwdInputBoxCell?.drawsBackground = true
        view?.addSubview(WiFiPopoverSubview.passwdInputBox!)
        
        WiFiPopoverSubview.passwdInputBox1?.stringValue = ""
        WiFiPopoverSubview.passwdInputBox1?.drawsBackground = true
        WiFiPopoverSubview.passwdInputBox1?.isEditable = true
        WiFiPopoverSubview.passwdInputBox1?.isSelectable = true
        WiFiPopoverSubview.passwdInputBox1?.font = NSFont.systemFont(ofSize: 13)
        WiFiPopoverSubview.passwdInputBox1?.delegate = self
        WiFiPopoverSubview.passwdInputBox1?.isHidden = false
        view?.addSubview(WiFiPopoverSubview.passwdInputBox1!)
        
        isShowPasswd?.setButtonType(.switch)
        isShowPasswd?.title = "显示密码"
        isShowPasswd?.target = self
        isShowPasswd?.action = #selector(showPasswd(_:))
        view?.addSubview(isShowPasswd!)
        
        isSave?.setButtonType(.switch)
        isSave?.title = "记住该网络"
        isSave?.target = self
        isSave?.action = #selector(saveWiFi(_:))
        view?.addSubview(isSave!)
        
        if let _ = view { addSubview(view!) }
    }
    
    @objc func showPasswd(_ sender: Any?) {
        if isShowPasswd?.state.rawValue == 0 {
            WiFiPopoverSubview.passwdInputBox1?.stringValue = WiFiPopoverSubview.passwdInputBox?.stringValue as! String
            WiFiPopoverSubview.passwdInputBox?.isHidden = true
            WiFiPopoverSubview.passwdInputBox1?.isHidden = false
            WiFiPopoverSubview.passwdInputBox1?.becomeFirstResponder()
            WiFiPopoverSubview.passwdInputBox1?.selectText(self)
            WiFiPopoverSubview.passwdInputBox1?.currentEditor()?.selectedRange = NSRange(location: "\(WiFiPopoverSubview.passwdInputBox1)".count, length: 0)
        }
        if isShowPasswd?.state.rawValue == 1 {
            WiFiPopoverSubview.passwdInputBox?.stringValue = WiFiPopoverSubview.passwdInputBox1?.stringValue as! String
            WiFiPopoverSubview.passwdInputBox?.isHidden = false
            WiFiPopoverSubview.passwdInputBox1?.isHidden = true
            WiFiPopoverSubview.passwdInputBox?.becomeFirstResponder()
            WiFiPopoverSubview.passwdInputBox?.selectText(self)
            WiFiPopoverSubview.passwdInputBox?.currentEditor()?.selectedRange = NSRange(location: "\(WiFiPopoverSubview.passwdInputBox)".count, length: 0)
        }
    }
    
    @objc func saveWiFi(_ sender: Any?) {

    }
    
    func controlTextDidChange(_ obj: Notification) {
        if WiFiPopoverSubview.passwdInputBox?.isHidden == false {
            WiFiPopoverSubview.passwdInputBox1?.stringValue = WiFiPopoverSubview.passwdInputBox?.stringValue as! String
        } else {
            WiFiPopoverSubview.passwdInputBox?.stringValue = WiFiPopoverSubview.passwdInputBox1?.stringValue as! String
        }
        if (WiFiPopoverSubview.passwdInputBox1?.stringValue.count)! < 8 && (WiFiPopoverSubview.passwdInputBox?.stringValue.count)! < 8 {
            WiFiPopup.buttons[0].isEnabled = false
        } else {
            WiFiPopup.buttons[0].isEnabled = true
        }
        if (WiFiPopoverSubview.passwdInputBox1?.stringValue.count)! > 64 {
            let index = WiFiPopoverSubview.passwdInputBox1?.stringValue.index((WiFiPopoverSubview.passwdInputBox1?.stringValue.startIndex)!, offsetBy: 64)
            WiFiPopoverSubview.passwdInputBox1?.stringValue = String((WiFiPopoverSubview.passwdInputBox1?.stringValue[..<index!])!)
        }
        if (WiFiPopoverSubview.passwdInputBox?.stringValue.count)! > 64 {
            let index = WiFiPopoverSubview.passwdInputBox?.stringValue.index((WiFiPopoverSubview.passwdInputBox?.stringValue.startIndex)!, offsetBy: 64)
            WiFiPopoverSubview.passwdInputBox?.stringValue = String((WiFiPopoverSubview.passwdInputBox?.stringValue[..<index!])!)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

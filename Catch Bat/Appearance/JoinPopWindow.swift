//
//  JoinPopWindow.swift
//  Catch Bat
//
//  Created by 梁怀宇 on 2020/4/8.
//  Copyright © 2020 lhy. All rights reserved.
//

import Foundation
import Cocoa

class JoinPopWindow:NSWindow, NSTextFieldDelegate {
    var normalView: NSView?
    var encryptView1: NSView?
    var encryptView2: NSView?
    var icon: NSImageView?
    var titleLabel: NSTextField?
    var subTitleLabel: NSTextField?
    var ssidLabel: NSTextField?
    var ssidBox: NSTextField?
    var securityLabel: NSTextField?
    var securityPop: NSPopUpButton?
    var passwdLabel: NSTextView?
    static var passwdInputBox: NSTextField?
    var passwdInputBoxCell: NSTextFieldCell?
    static var passwdInputBox1: NSSecureTextField?
    var isShowPasswd: NSButton?
    var isSave:NSButton?
    var joinButton: NSButton?
    var cancelButton: NSButton?
    
    override init(contentRect: NSRect, styleMask style: NSWindow.StyleMask, backing backingStoreType: NSWindow.BackingStoreType, defer flag: Bool) {
        super.init(contentRect: contentRect, styleMask: style, backing: backingStoreType, defer: flag)
        normalView = NSView(frame: NSRect(x: 0, y: 0, width: 450, height: 247))
        encryptView1 = NSView(frame: NSRect(x: 0, y: 0, width: 450, height: 295))
        encryptView2 = NSView(frame: NSRect(x: 0, y: 0, width: 450, height: 323))
        icon = NSImageView(frame: NSRect(x: 25, y: 167, width: 64, height: 64))
        titleLabel = NSTextField(frame: NSRect(x: 105, y: 212, width: 345, height: 16))
        subTitleLabel = NSTextField(frame: NSRect(x: 105, y: 200, width: 250, height: 14))
        ssidLabel = NSTextField(frame: NSRect(x: 100, y: 132, width: 70, height: 19))
        ssidBox = NSTextField(frame: NSRect(x: 173, y: 132, width: 255, height: 21))
        securityLabel = NSTextField(frame: NSRect(x: 113, y: 103, width: 70, height: 19))
        securityPop = NSPopUpButton(frame: NSRect(x: 171, y: 100, width: 260, height: 26))
        passwdLabel = NSTextView(frame: NSRect(x: 128, y: 124, width: 100, height: 21))
        JoinPopWindow.passwdInputBox = NSTextField(frame: NSRect(x: 173, y: 124, width: 255, height: 21))
        passwdInputBoxCell = NSTextFieldCell.init()
        JoinPopWindow.passwdInputBox1 = NSSecureTextField(frame: NSRect(x: 173, y: 124, width: 255, height: 21))
        isShowPasswd = NSButton(frame: NSRect(x: 173, y: 100, width: 100, height: 18))
        isSave = NSButton(frame: NSRect(x: 173, y: 80, width: 100, height: 18))
        joinButton = NSButton(frame: NSRect(x: 353, y: 18, width: 85, height: 22))
        cancelButton = NSButton(frame: NSRect(x: 269, y: 18, width: 85, height: 22))
        
        icon?.image = NSImage.init(named: "WiFi")
        
        titleLabel?.stringValue = "查找并加入Wi-Fi网络。"
        titleLabel?.drawsBackground = false
        titleLabel?.isBordered = false
        titleLabel?.isSelectable = false
        titleLabel?.font = NSFont.boldSystemFont(ofSize: 13)//systemFont(ofSize: 13).
        
        subTitleLabel?.stringValue = "输入您想要加入的网络的名称和安全性类型。"
        subTitleLabel?.drawsBackground = false
        subTitleLabel?.isBordered = false
        subTitleLabel?.isSelectable = false
        subTitleLabel?.font = NSFont.systemFont(ofSize: 11)
        
        ssidLabel?.stringValue = "网络名称："
        ssidLabel?.drawsBackground = false
        ssidLabel?.isBordered = false
        ssidLabel?.isSelectable = false
        ssidLabel?.font = NSFont.systemFont(ofSize: 13)
        
        ssidBox?.stringValue = ""
        ssidBox?.drawsBackground = true
        ssidBox?.isEditable = true
        ssidBox?.isSelectable = true
        ssidBox?.font = .systemFont(ofSize: 13)
        ssidBox?.delegate = self
        
        securityLabel?.stringValue = "安全性："
        securityLabel?.drawsBackground = false
        securityLabel?.isBordered = false
        securityLabel?.isSelectable = false
        securityLabel?.font = .systemFont(ofSize: 13)
        
        securityPop?.addItem(withTitle: "无")
        securityPop?.menu?.addItem(.separator())
        securityPop?.addItem(withTitle: "WEP")
        securityPop?.addItem(withTitle: "WPA/WPA2个人级")
        securityPop?.addItem(withTitle: "WPA2/WPA3个人级")
        securityPop?.addItem(withTitle: "WPA3个人级")
        securityPop?.menu?.addItem(.separator())
        securityPop?.addItem(withTitle: "动态WEP")
        securityPop?.addItem(withTitle: "WPA/WPA2企业级")
        securityPop?.addItem(withTitle: "WPA2企业级")
        securityPop?.addItem(withTitle: "WPA3企业级")
        
        passwdLabel?.string = "密码："
        passwdLabel?.drawsBackground = false
        passwdLabel?.isEditable = false
        passwdLabel?.isSelectable = false
        passwdLabel?.font = NSFont.systemFont(ofSize: 13)
        passwdLabel?.isHidden = true
        contentView?.addSubview(passwdLabel!)
        
        JoinPopWindow.passwdInputBox?.cell = passwdInputBoxCell
        passwdInputBoxCell?.allowedInputSourceLocales = [NSAllRomanInputSourcesLocaleIdentifier]
        passwdInputBoxCell?.isBordered = true
        JoinPopWindow.passwdInputBox?.stringValue = ""
        JoinPopWindow.passwdInputBox?.drawsBackground = true
        JoinPopWindow.passwdInputBox?.isEditable = true
        JoinPopWindow.passwdInputBox?.isSelectable = true
        JoinPopWindow.passwdInputBox?.font = NSFont.systemFont(ofSize: 13)
        JoinPopWindow.passwdInputBox?.delegate = self
        JoinPopWindow.passwdInputBox?.isHidden = true
        contentView?.addSubview(JoinPopWindow.passwdInputBox!)
        
        JoinPopWindow.passwdInputBox1?.stringValue = ""
        JoinPopWindow.passwdInputBox1?.drawsBackground = true
        JoinPopWindow.passwdInputBox1?.isEditable = true
        JoinPopWindow.passwdInputBox1?.isSelectable = true
        JoinPopWindow.passwdInputBox1?.font = NSFont.systemFont(ofSize: 13)
        JoinPopWindow.passwdInputBox1?.delegate = self
        JoinPopWindow.passwdInputBox1?.isHidden = true
        contentView?.addSubview(JoinPopWindow.passwdInputBox1!)
        
        isShowPasswd?.setButtonType(.switch)
        isShowPasswd?.title = "显示密码"
        isShowPasswd?.target = self
        isShowPasswd?.action = #selector(showPasswd(_:))
        isShowPasswd?.isHidden = true
        contentView?.addSubview(isShowPasswd!)
        
        isSave?.setButtonType(.switch)
        isSave?.title = "记住该网络"
        isSave?.target = self
        isSave?.action = #selector(saveWiFi(_:))
        
        joinButton?.bezelStyle = NSButton.BezelStyle.rounded
        joinButton?.title = "加入"
        joinButton?.target = self
        joinButton?.isEnabled = false
        //joinButton?.action = #selector()
        
        cancelButton?.bezelStyle = .rounded
        cancelButton?.title = "取消"
        cancelButton?.target = self
        cancelButton?.action = #selector(cancel(_:))
        
        normalView?.addSubview(icon!)
        normalView?.addSubview(titleLabel!)
        normalView?.addSubview(subTitleLabel!)
        normalView?.addSubview(ssidLabel!)
        normalView?.addSubview(ssidBox!)
        normalView?.addSubview(securityPop!)
        normalView?.addSubview(securityLabel!)
        normalView?.addSubview(isSave!)
        normalView?.addSubview(joinButton!)
        normalView?.addSubview(cancelButton!)
        
        contentView = normalView
        isReleasedWhenClosed = false
        level = .floating
        center()
    }
    
    @objc func showPasswd(_ sender: Any?) {
        if isShowPasswd?.state.rawValue == 0 {
            JoinPopWindow.passwdInputBox1?.stringValue = JoinPopWindow.passwdInputBox?.stringValue as! String
            JoinPopWindow.passwdInputBox?.isHidden = true
            JoinPopWindow.passwdInputBox1?.isHidden = false
            JoinPopWindow.passwdInputBox1?.becomeFirstResponder()
            JoinPopWindow.passwdInputBox1?.selectText(self)
            JoinPopWindow.passwdInputBox1?.currentEditor()?.selectedRange = NSRange(location: "\(JoinPopWindow.passwdInputBox1)".count, length: 0)
        }
        if isShowPasswd?.state.rawValue == 1 {
            JoinPopWindow.passwdInputBox?.stringValue = JoinPopWindow.passwdInputBox1?.stringValue as! String
            JoinPopWindow.passwdInputBox?.isHidden = false
            JoinPopWindow.passwdInputBox1?.isHidden = true
            JoinPopWindow.passwdInputBox?.becomeFirstResponder()
            JoinPopWindow.passwdInputBox?.selectText(self)
            JoinPopWindow.passwdInputBox?.currentEditor()?.selectedRange = NSRange(location: "\(JoinPopWindow.passwdInputBox)".count, length: 0)
        }
    }
    
    @objc func saveWiFi(_ sender: Any?) {
        if isSave?.state.rawValue == 0 {
            
            setFrame(NSRect(x: frame.minX, y: frame.minY + 48, width: 450, height: 269), display: false, animate: true)
            normalView?.frame = NSRect(x: 0, y: 0, width: 450, height: 247)
        }
        if isSave?.state.rawValue == 1 {
            
            //contentView = normalView
            setFrame(NSRect(x: frame.minX, y: frame.minY - 48, width: 450, height: 317), display: false, animate: true)
            normalView?.frame = NSRect(x: 0, y: 48, width: 450, height: 247)
        }
    }
    
    @objc func cancel(_ sender: Any?) {
        popWindow?.close()
    }
    
    func controlTextDidChange(_ obj: Notification) {
        if JoinPopWindow.passwdInputBox?.isHidden == false {
            JoinPopWindow.passwdInputBox1?.stringValue = JoinPopWindow.passwdInputBox?.stringValue as! String
        } else {
            JoinPopWindow.passwdInputBox?.stringValue = JoinPopWindow.passwdInputBox1?.stringValue as! String
        }
        if (JoinPopWindow.passwdInputBox1?.stringValue.count)! < 8 && (JoinPopWindow.passwdInputBox?.stringValue.count)! < 8 {
            joinButton?.isEnabled = false
        } else {
            joinButton?.isEnabled = true
        }
        if (JoinPopWindow.passwdInputBox1?.stringValue.count)! > 64 {
            let index = JoinPopWindow.passwdInputBox1?.stringValue.index((JoinPopWindow.passwdInputBox1?.stringValue.startIndex)!, offsetBy: 64)
            JoinPopWindow.passwdInputBox1?.stringValue = String((JoinPopWindow.passwdInputBox1?.stringValue[..<index!])!)
        }
        if (JoinPopWindow.passwdInputBox?.stringValue.count)! > 64 {
            let index = JoinPopWindow.passwdInputBox?.stringValue.index((JoinPopWindow.passwdInputBox?.stringValue.startIndex)!, offsetBy: 64)
            JoinPopWindow.passwdInputBox?.stringValue = String((JoinPopWindow.passwdInputBox?.stringValue[..<index!])!)
        }
    }
}

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
    var view: NSView?
    var buttonView: NSView?
    var icon: NSImageView?
    var titleLabel: NSTextField?
    var subTitleLabel: NSTextField?
    var ssidLabel: NSTextField?
    var ssidBox: NSTextField?
    var securityLabel: NSTextField?
    var securityPop: NSPopUpButton?
    var usernameLabel: NSTextField?
    var usernameBox: NSTextField?
    var passwdLabel: NSTextView?
    static var passwdInputBox: NSTextField?
    var passwdInputBoxCell: NSTextFieldCell?
    static var passwdInputBox1: NSSecureTextField?
    var isShowPasswd: NSButton?
    var isSave: NSButton?
    var joinButton: NSButton?
    var cancelButton: NSButton?
    
    override init(contentRect: NSRect, styleMask style: NSWindow.StyleMask, backing backingStoreType: NSWindow.BackingStoreType, defer flag: Bool) {
        super.init(contentRect: contentRect, styleMask: style, backing: backingStoreType, defer: flag)
        view = NSView(frame: NSRect(x: 0, y: 0, width: 450, height: 247))
        buttonView = NSView(frame: NSRect(x: 0, y: 0, width: 450, height: 175))
        icon = NSImageView(frame: NSRect(x: 25, y: 167, width: 64, height: 64))
        titleLabel = NSTextField(frame: NSRect(x: 105, y: 212, width: 345, height: 16))
        subTitleLabel = NSTextField(frame: NSRect(x: 105, y: 200, width: 250, height: 14))
        ssidLabel = NSTextField(frame: NSRect(x: 100, y: 132, width: 70, height: 19))
        ssidBox = NSTextField(frame: NSRect(x: 173, y: 132, width: 255, height: 21))
        securityLabel = NSTextField(frame: NSRect(x: 113, y: 103, width: 70, height: 19))
        securityPop = NSPopUpButton(frame: NSRect(x: 171, y: 100, width: 260, height: 26))
        usernameLabel = NSTextField(frame: NSRect(x: 113, y: 150, width: 70, height: 19))
        usernameBox = NSTextField(frame: NSRect(x: 173, y: 151, width: 255, height: 21))
        passwdLabel = NSTextView(frame: NSRect(x: 124, y: 121, width: 100, height: 19))
        JoinPopWindow.passwdInputBox = NSTextField(frame: NSRect(x: 173, y: 124, width: 255, height: 21))
        passwdInputBoxCell = NSTextFieldCell.init()
        JoinPopWindow.passwdInputBox1 = NSSecureTextField(frame: NSRect(x: 173, y: 124, width: 255, height: 21))
        isShowPasswd = NSButton(frame: NSRect(x: 173, y: 100, width: 100, height: 18))
        isSave = NSButton(frame: NSRect(x: 173, y: 80, width: 100, height: 18))
        joinButton = NSButton(frame: NSRect(x: 353, y: 18, width: 85, height: 22))
        cancelButton = NSButton(frame: NSRect(x: 269, y: 18, width: 85, height: 22))
        
        icon?.image = NSImage.init(named: "WiFi")
        view?.addSubview(icon!)
        
        titleLabel?.stringValue = "查找并加入Wi-Fi网络。"
        titleLabel?.drawsBackground = false
        titleLabel?.isBordered = false
        titleLabel?.isSelectable = false
        titleLabel?.font = NSFont.boldSystemFont(ofSize: 13)//systemFont(ofSize: 13).
        view?.addSubview(titleLabel!)
        
        subTitleLabel?.stringValue = "输入您想要加入的网络的名称和安全性类型。"
        subTitleLabel?.drawsBackground = false
        subTitleLabel?.isBordered = false
        subTitleLabel?.isSelectable = false
        subTitleLabel?.font = NSFont.systemFont(ofSize: 11)
        view?.addSubview(subTitleLabel!)
        
        ssidLabel?.stringValue = "网络名称："
        ssidLabel?.drawsBackground = false
        ssidLabel?.isBordered = false
        ssidLabel?.isSelectable = false
        ssidLabel?.font = NSFont.systemFont(ofSize: 13)
        view?.addSubview(ssidLabel!)
        
        ssidBox?.stringValue = ""
        ssidBox?.drawsBackground = true
        ssidBox?.isEditable = true
        ssidBox?.isSelectable = true
        ssidBox?.font = .systemFont(ofSize: 13)
        ssidBox?.delegate = self
        view?.addSubview(ssidBox!)
        
        securityLabel?.stringValue = "安全性："
        securityLabel?.drawsBackground = false
        securityLabel?.isBordered = false
        securityLabel?.isSelectable = false
        securityLabel?.font = .systemFont(ofSize: 13)
        view?.addSubview(securityLabel!)
        
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
        securityPop?.target = self
        securityPop?.action = #selector(security(_:))
        view?.addSubview(securityPop!)
        
        usernameLabel?.stringValue = "用户名："
        usernameLabel?.drawsBackground = false
        usernameLabel?.isBordered = false
        usernameLabel?.isSelectable = false
        usernameLabel?.font = .systemFont(ofSize: 13)
        usernameLabel?.isHidden = true
        buttonView?.addSubview(usernameLabel!)
        
        usernameBox?.stringValue = ""
        usernameBox?.drawsBackground = true
        usernameBox?.isBordered = true
        usernameBox?.isEditable = true
        usernameBox?.isSelectable = true
        usernameBox?.font = .systemFont(ofSize: 13)
        usernameBox?.delegate = self
        usernameBox?.isHidden = true
        buttonView?.addSubview(usernameBox!)
        
        passwdLabel?.string = "密码："
        passwdLabel?.drawsBackground = false
        passwdLabel?.isEditable = false
        passwdLabel?.isSelectable = false
        passwdLabel?.font = NSFont.systemFont(ofSize: 13)
        passwdLabel?.isHidden = true
        buttonView?.addSubview(passwdLabel!)
        
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
        buttonView?.addSubview(JoinPopWindow.passwdInputBox!)
        
        JoinPopWindow.passwdInputBox1?.stringValue = ""
        JoinPopWindow.passwdInputBox1?.drawsBackground = true
        JoinPopWindow.passwdInputBox1?.isEditable = true
        JoinPopWindow.passwdInputBox1?.isSelectable = true
        JoinPopWindow.passwdInputBox1?.font = NSFont.systemFont(ofSize: 13)
        JoinPopWindow.passwdInputBox1?.delegate = self
        JoinPopWindow.passwdInputBox1?.isHidden = true
        buttonView?.addSubview(JoinPopWindow.passwdInputBox1!)
        
        isShowPasswd?.setButtonType(.switch)
        isShowPasswd?.title = "显示密码"
        isShowPasswd?.target = self
        isShowPasswd?.action = #selector(showPasswd(_:))
        isShowPasswd?.isHidden = true
        buttonView?.addSubview(isShowPasswd!)
        
        isSave?.setButtonType(.switch)
        isSave?.title = "记住该网络"
        isSave?.target = self
        isSave?.action = #selector(saveWiFi(_:))
        buttonView?.addSubview(isSave!)
        
        joinButton?.bezelStyle = NSButton.BezelStyle.rounded
        joinButton?.title = "加入"
        joinButton?.target = self
        joinButton?.isEnabled = false
        //joinButton?.action = #selector()
        buttonView?.addSubview(joinButton!)
        
        cancelButton?.bezelStyle = .rounded
        cancelButton?.title = "取消"
        cancelButton?.target = self
        cancelButton?.action = #selector(cancel(_:))
        buttonView?.addSubview(cancelButton!)
        
        view?.autoresizingMask = .minYMargin
        buttonView?.autoresizingMask = .maxYMargin
        
        preservesContentDuringLiveResize = true
        contentView?.addSubview(view!)
        contentView?.addSubview(buttonView!)
        isReleasedWhenClosed = false
        level = .floating
        center()
    }
    
    @objc func security(_ sender: Any?) {
        switch (securityPop?.indexOfSelectedItem)! {
        case 0:
            usernameLabel?.isHidden = true
            usernameBox?.isHidden = true
            passwdLabel?.isHidden = true
            JoinPopWindow.passwdInputBox?.isHidden = true
            JoinPopWindow.passwdInputBox1?.isHidden = true
            isShowPasswd?.isHidden = true
            ssidBox?.becomeFirstResponder()
            if frame.height == 317 {
                let Frame = NSRect(x: frame.minX, y: frame.minY + 48, width: 450, height: 269)
                setFrame(Frame, display: false, animate: true)
            }
            if frame.height == 345 {
                let Frame = NSRect(x: frame.minX, y: frame.minY + 76, width: 450, height: 269)
                setFrame(Frame, display: false, animate: true)
            }
        case 2, 3, 4, 5:
            if frame.height == 269 {
                let Frame = NSRect(x: frame.minX, y: frame.minY - 48, width: 450, height: 317)
                setFrame(Frame, display: false, animate: true)
            }
            usernameLabel?.isHidden = true
            usernameBox?.isHidden = true
            passwdLabel?.isHidden = false
            JoinPopWindow.passwdInputBox?.isHidden = false
            JoinPopWindow.passwdInputBox1?.isHidden = true
            isShowPasswd?.isHidden = false
            if frame.height == 345 {
                let Frame = NSRect(x: frame.minX, y: frame.minY + 28, width: 450, height: 317)
                setFrame(Frame, display: false, animate: true)
            }
            JoinPopWindow.passwdInputBox?.becomeFirstResponder()
        case 7, 8, 9, 10:
            if frame.height == 269 {
                let Frame = NSRect(x: frame.minX, y: frame.minY - 76, width: 450, height: 345)
                setFrame(Frame, display: false, animate: true)
            }
            if frame.height == 317 {
                let Frame = NSRect(x: frame.minX, y: frame.minY - 28, width: 450, height: 345)
                setFrame(Frame, display: false, animate: true)
            }
            usernameLabel?.isHidden = false
            usernameBox?.isHidden = false
            passwdLabel?.isHidden = false
            JoinPopWindow.passwdInputBox?.isHidden = false
            JoinPopWindow.passwdInputBox1?.isHidden = true
            isShowPasswd?.isHidden = false
            usernameBox?.becomeFirstResponder()
        default:
            return
        }
    }
    
    @objc func showPasswd(_ sender: Any?) {
        if isShowPasswd?.state.rawValue == 0 {
            JoinPopWindow.passwdInputBox1?.stringValue = (JoinPopWindow.passwdInputBox?.stringValue)!
            JoinPopWindow.passwdInputBox?.isHidden = true
            JoinPopWindow.passwdInputBox1?.isHidden = false
            JoinPopWindow.passwdInputBox1?.becomeFirstResponder()
            JoinPopWindow.passwdInputBox1?.selectText(self)
            JoinPopWindow.passwdInputBox1?.currentEditor()?.selectedRange = NSRange(location: "\((JoinPopWindow.passwdInputBox1)!)".count, length: 0)
        }
        if isShowPasswd?.state.rawValue == 1 {
            JoinPopWindow.passwdInputBox?.stringValue = (JoinPopWindow.passwdInputBox1?.stringValue)!
            JoinPopWindow.passwdInputBox?.isHidden = false
            JoinPopWindow.passwdInputBox1?.isHidden = true
            JoinPopWindow.passwdInputBox?.becomeFirstResponder()
            JoinPopWindow.passwdInputBox?.selectText(self)
            JoinPopWindow.passwdInputBox?.currentEditor()?.selectedRange = NSRange(location: "\((JoinPopWindow.passwdInputBox)!)".count, length: 0)
        }
    }
    
    @objc func saveWiFi(_ sender: Any?) {
        if isSave?.state.rawValue == 0 {
        }
        if isSave?.state.rawValue == 1 {
        }
        
    }
    
    @objc func cancel(_ sender: Any?) {
        close()
    }
    
    func controlTextDidChange(_ obj: Notification) {
        if JoinPopWindow.passwdInputBox?.isHidden == false {
            JoinPopWindow.passwdInputBox1?.stringValue = (JoinPopWindow.passwdInputBox?.stringValue)!
        } else {
            JoinPopWindow.passwdInputBox?.stringValue = (JoinPopWindow.passwdInputBox1?.stringValue)!
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

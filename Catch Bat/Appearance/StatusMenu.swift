//
//  StatusMenuView.swift
//  Catch Bat
//
//  Created by 梁怀宇 on 2020/4/5.
//  Copyright © 2020 lhy. All rights reserved.
//

import Foundation
import Cocoa

class StatusMenu: NSMenu, NSMenuDelegate {
    //var timer: Timer?
    //var count:Int = 8
    
    override init(title: String) {
        super.init(title: title)
        minimumWidth = CGFloat(285.0)
        delegate = self
        //autoenablesItems = false
        removeAllItems()
        
        addItem(withTitle: "接口名称： en1", action: nil, keyEquivalent: "").isHidden = true
        addItem(withTitle: "地址： ac:e0:10:95:3e:35", action: nil, keyEquivalent: "").isHidden = true
        addItem(withTitle: "启用Wi-Fi记录", action: #selector(clickMenuItem(_:)), keyEquivalent: "").target = self
        addItem(withTitle: "创建诊断报告...", action: #selector(clickMenuItem(_:)), keyEquivalent: "").target = self
        addItem(withTitle: "打开无线诊断...", action: #selector(clickMenuItem(_:)), keyEquivalent: "").target = self
        addItem(NSMenuItem.separator())
        addItem(withTitle: "Wi-FI:  关闭", action: nil, keyEquivalent: "").isEnabled = false
        addItem(withTitle: "开启Wi-Fi", action: #selector(clickMenuItem(_:)), keyEquivalent: "").target = self
        addItem(NSMenuItem.separator())
        for _ in 9..<items.count {
            removeItem(at: 9)
        }
        ssid = "Catch Bat"; isConnect = true; isEncrypted = true
        addItem(withTitle: "Catch Bat", action: #selector(clickMenuItem(_:)), keyEquivalent: "").view = wifiMenuItemView(frame: NSRect(x: 0, y: 0, width: 285, height: 20))
        ssid = "Catch Dog"; isConnect = false; isEncrypted = false
        addItem(withTitle: "Catch Dog", action: #selector(clickMenuItem(_:)), keyEquivalent: "").view = wifiMenuItemView(frame: NSRect(x: 0, y: 0, width: 285, height: 20))
        ssid = "Catch Star"; isConnect = false; isEncrypted = false
        addItem(withTitle: "Catch Star", action: #selector(clickMenuItem(_:)), keyEquivalent: "").view = wifiMenuItemView(frame: NSRect(x: 0, y: 0, width: 285, height: 20))
        ssid = "Catch iStar"; isConnect = false; isEncrypted = false
        addItem(withTitle: "Catch iStar", action: #selector(clickMenuItem(_:)), keyEquivalent: "").view = wifiMenuItemView(frame: NSRect(x: 0, y: 0, width: 285, height: 20))
        ssid = "Catch penghubingzhou"; isConnect = false; isEncrypted = false
        addItem(withTitle: "Catch penghubingzhou", action: #selector(clickMenuItem(_:)), keyEquivalent: "").view = wifiMenuItemView(frame: NSRect(x: 0, y: 0, width: 285, height: 20))
        ssid = "Catch Hackintosh Tiny Bing"; isConnect = false; isEncrypted = false
        addItem(withTitle: "Catch Hackintosh Tiny Bing", action: #selector(clickMenuItem(_:)), keyEquivalent: "").view = wifiMenuItemView(frame: NSRect(x: 0, y: 0, width: 285, height: 20))
        addItem(NSMenuItem.separator())
        addItem(withTitle: "加入其他网络...", action: #selector(clickMenuItem(_:)), keyEquivalent: "").target = self
        addItem(withTitle: "创建网络...", action: #selector(clickMenuItem(_:)), keyEquivalent: "").target = self
        addItem(withTitle: "打开网络偏好设置...", action: #selector(clickMenuItem(_:)), keyEquivalent: "").target = self
        addItem(withTitle: "放走Bat", action: #selector(clickMenuItem(_:)), keyEquivalent: "").target = self
    }
    
    func menuWillOpen(_ menu: NSMenu) {
        
        if (NSApp.currentEvent?.modifierFlags.contains(.option))! {
            // 当按下 option 键显示特殊菜单
            buildOptionMenu()
            items[items.count - 1].isHidden = false
        } else {
            buildNormalMenu()
            items[items.count - 1].isHidden = true
        }
        
    }
    
    func buildNormalMenu() {
        for i in 0...5 {
            items[i].isHidden = true
        }
    }
    
    func buildOptionMenu() {
        for i in 0...5 {
            items[i].isHidden = false
        }
    }
    
    @objc func clickMenuItem(_ sender:NSMenuItem){
        print(sender.title)
        switch sender.title {
        case "开启Wi-Fi":
            items[6].title = "Wi-Fi: 开启"
            items[7].title = "关闭Wi-Fi"
            StatusBarIcon.on()
        case "关闭Wi-Fi":
            items[6].title = "Wi-Fi: 关闭"
            items[7].title = "开启Wi-Fi"
            //timer?.invalidate()
            //timer = nil
            StatusBarIcon.off()
        case "加入其他网络...":
            let joinPop = JoinPopWindow.init(contentRect: NSRect(x: 0, y: 0, width: 450, height: 247), styleMask: .titled, backing: .buffered, defer: false)
            joinPop.makeKeyAndOrderFront(self)
        case "打开网络偏好设置...":
            NSWorkspace.shared.openFile("/System/Library/PreferencePanes/Network.prefPane")
        case "放走Bat":
            exit(0)
        default:
            print("Default")
            //let url = URL(string: "x-apple.systempreferences:com.apple.preference.network")!
            //NSWorkspace.shared.open(url)
        }
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

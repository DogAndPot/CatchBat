//
//  Functions.swift
//  Catch Bat
//
//  Created by 梁怀宇 on 2020/4/6.
//  Copyright © 2020 lhy. All rights reserved.
//

import Foundation
import Cocoa

class Functions {
    class func WiFiPop() {
        WiFiPopup.icon = NSImage.init(named: "WiFi")
        WiFiPopup.messageText = "Wi-Fi网络“Catch Bat”需要WPA2密码。"
        WiFiPopup.alertStyle = NSAlert.Style.informational
        WiFiPopup.addButton(withTitle: "加入")
        WiFiPopup.addButton(withTitle: "取消")
        WiFiPopup.buttons[0].isEnabled = false
        WiFiPopup.showsHelp = true
        WiFiPopup.accessoryView = WiFiPopoverSubview(frame: NSRect(x: 0, y: 0, width: 300, height: 80))//WiFiSubView
        WiFiPopup.window.initialFirstResponder = WiFiPopoverSubview.passwdInputBox1 //WiFiPasswdField
        WiFiPopup.runModal()
    }
}

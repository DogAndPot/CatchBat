//
//  AppDelegate.swift
//  Catch Bat
//
//  Created by 梁怀宇 on 2020/3/20.
//  Copyright © 2020 lhy. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate, NSTextFieldDelegate, NSMenuDelegate {

    @IBOutlet weak var window: NSWindow!
    @IBOutlet weak var statusMenu: NSMenu!
    @IBOutlet weak var WiFiSubView: NSView!
    @IBOutlet weak var WiFiPasswdField: NSSecureTextField!
    @IBOutlet weak var WiFiPasswdField1: NSTextField!
    @IBOutlet weak var isShowPasswd: NSButton!
    @IBOutlet weak var WiFiNameMenu: NSView!
    @IBOutlet weak var WiFiStatusMenuItem: NSMenuItem!
    @IBOutlet weak var ToggleWiFiButton: NSMenuItem!
    @IBOutlet weak var QuitButton: NSMenuItem!
    @IBOutlet weak var PortName: NSMenuItem!
    @IBOutlet weak var MacAddress: NSMenuItem!
    @IBOutlet weak var WiFiSSID: NSTextField!
    @IBOutlet weak var WiFiSignal: NSImageView!
    @IBOutlet weak var WiFiConnected: NSImageView!
    @IBOutlet weak var WiFiEncryption: NSImageView!
    @IBOutlet weak var WiFiList: NSTableView!
    
    var statusBar:NSStatusItem!
    let WiFiPopup:NSAlert = NSAlert()
    var Password:String = ""
    var count:Int = 8
    var WiFiStatus:Bool = false
    var timer = Timer.init()
    var wifiList: WiFiListView?
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        
        WiFiPasswdField.isHidden = false
        WiFiPasswdField1.isHidden = true
        
        wifiList = WiFiListView(frame: NSRect(x: 0, y: 0, width: 285, height: 60))
        
        
        statusMenu.minimumWidth = CGFloat(285.0)
        statusMenu.title = ""
        statusBar = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        statusBar.button?.image = NSImage.init(named: "AirPortOff")
        statusBar.button?.image?.isTemplate = true
        statusBar.menu = statusMenu
        statusBar.menu?.delegate = self
        
        addWiFi(ssid: "Catch Bat", connoeted: true, Encrypted: true)
        statusMenu.addItem(NSMenuItem.separator())
        statusMenu.addItem(withTitle: "加入其他网络...", action: #selector(clickMenuItem(_:)), keyEquivalent: "")
        statusMenu.addItem(withTitle: "创建网络...", action: #selector(clickMenuItem(_:)), keyEquivalent: "")
        statusMenu.addItem(withTitle: "打开网络偏好设置...", action: #selector(clickMenuItem(_:)), keyEquivalent: "")
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    @IBAction func ToggleWiFiStatus(_ sender: Any) {
        if WiFiStatus {
            WiFiStatus = false
            ToggleWiFiButton.title = "开启Wi-Fi"
            WiFiStatusMenuItem.title = "Wi-Fi: 关闭"
            statusBar.button?.image = NSImage.init(named: "AirPortOff")
        } else {
            WiFiStatus = true
            ToggleWiFiButton.title = "关闭Wi-Fi"
            WiFiStatusMenuItem.title = "Wi-Fi: 开启"
            timer = Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(tick), userInfo: nil, repeats: true)
        }
    }
    
    @IBAction func Quit(_ sender: Any) {
        exit(0)
    }
    
    @objc func tick() {
        count -= 1
        switch count {
        case 7:
            statusBar.button?.image = NSImage.init(named: "AirPortScanning1")
        case 6:
            statusBar.button?.image = NSImage.init(named: "AirPortScanning2")
        case 5:
            statusBar.button?.image = NSImage.init(named: "AirPortScanning3")
        case 4:
            statusBar.button?.image = NSImage.init(named: "AirPortScanning4")
        case 3:
            statusBar.button?.image = NSImage.init(named: "AirPortScanning3")
        case 2:
            statusBar.button?.image = NSImage.init(named: "AirPortScanning2")
        case 1:
            statusBar.button?.image = NSImage.init(named: "AirPortScanning1")
        case 0:
            count = 8
            timer.fireDate = Date.distantFuture
            statusBar.button?.image = NSImage.init(named: "AirPort4")
        default:
            return
        }
    }
    
    func addWiFi(ssid:String, connoeted:Bool,Encrypted:Bool) {
        WiFiConnected.isHidden = true
        WiFiEncryption.isHidden = true
        WiFiSSID.stringValue = ssid
        if connoeted {
            WiFiConnected.isHidden = false
        }
        if Encrypted {
            WiFiEncryption.isHidden = false
        }
        statusMenu.addItem(withTitle: ssid, action: #selector(clickMenuItem(_:)), keyEquivalent: "")
        statusMenu.item(withTitle: ssid)?.view = wifiMenuItemView(frame: NSRect(x: 0, y: 0, width: 285, height: 20))//wifiList//WiFiNameMenu
        statusMenu.item(withTitle: ssid)?.isEnabled = true
    }
    
    @objc func clickMenuItem(_ sender:NSMenuItem){
        print(sender.title)
    }
    
    func WiFiPop() {
        WiFiPopup.icon = NSImage.init(named: "WiFi")
        WiFiPopup.messageText = "Wi-Fi网络“Catch Bat”需要WPA2密码。"
        WiFiPopup.alertStyle = NSAlert.Style.informational
        WiFiPopup.addButton(withTitle: "加入")
        WiFiPopup.addButton(withTitle: "取消")
        WiFiPopup.buttons[0].isEnabled = false
        WiFiPopup.showsHelp = true
        WiFiPopup.accessoryView = WiFiSubView
        WiFiPopup.window.initialFirstResponder = WiFiPasswdField
        WiFiPopup.runModal()
    }
    
    @IBAction func ShowPasswd(_ sender: Any) {
        if (sender as! NSButton).state.rawValue == 1 {
            WiFiPasswdField1.stringValue = WiFiPasswdField.stringValue
            WiFiPasswdField.isHidden = true
            WiFiPasswdField1.isHidden = false
            WiFiPasswdField1.becomeFirstResponder()
        }
        if (sender as! NSButton).state.rawValue == 0 {
            WiFiPasswdField.stringValue = WiFiPasswdField1.stringValue
            WiFiPasswdField1.isHidden = true
            WiFiPasswdField.isHidden = false
            WiFiPasswdField.becomeFirstResponder()
        }
    }

    func menuWillOpen(_ menu: NSMenu) {
        if (NSApp.currentEvent?.modifierFlags.contains(.option))! {
            // 当按下 option 键显示特殊菜单
            print("Option")
            buildOptionMenu()
        } else {
            buildNormalMenu()
        }
    }
    
    func buildNormalMenu() {
        QuitButton.isHidden = true
        PortName.isHidden = true
        MacAddress.isHidden = true
    }
    
    func buildOptionMenu() {
        QuitButton.isHidden = false
        PortName.isHidden = false
        MacAddress.isHidden = false
    }
    
    var data: [WiFi] = Array()
    func numberOfRows(in tableView: NSTableView) -> Int {
        return data.count
    }
    func tableView(_ tableView: NSTableView, objectValueFor tableColumn: NSTableColumn?, row: Int) -> Any? {
        return data[row]
    }
    
    func controlTextDidChange(_ notification: Notification) {
        if WiFiPasswdField.stringValue.count < 8 && WiFiPasswdField1.stringValue.count < 8 {
            WiFiPopup.buttons[0].isEnabled = false
        } else {
            WiFiPopup.buttons[0].isEnabled = true
        }
        if WiFiPasswdField.stringValue.count > 64 {
            let index = WiFiPasswdField.stringValue.index(WiFiPasswdField.stringValue.startIndex, offsetBy: 64)
            WiFiPasswdField.stringValue = String(WiFiPasswdField.stringValue[..<index])
        }
        if WiFiPasswdField1.stringValue.count > 64 {
            let index = WiFiPasswdField1.stringValue.index(WiFiPasswdField1.stringValue.startIndex, offsetBy: 64)
            WiFiPasswdField1.stringValue = String(WiFiPasswdField1.stringValue[..<index])
        }
    }
}

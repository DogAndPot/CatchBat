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
    @IBOutlet weak var WiFiName: NSMenuItem!
    @IBOutlet weak var WiFiNameMenu: NSView!
    
    var statusBar:NSStatusItem!
    let WiFiPopup:NSAlert = NSAlert()
    var Password:String = ""
    
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        WiFiPasswdField.isHidden = false
        WiFiPasswdField1.isHidden = true
        
        WiFiName.target = self
        WiFiName.view = WiFiNameMenu
        
        statusMenu.minimumWidth = CGFloat(285.0)
        statusMenu.title = ""
        statusBar = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        statusBar.button?.image = NSImage.init(named: "AirPortInMenu0-1")
        statusBar.button?.image?.isTemplate = true
        statusBar.menu = statusMenu
        statusBar.menu?.delegate = self
        
        WiFiPop()

    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
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
            print(0)
            WiFiPasswdField1.stringValue = WiFiPasswdField.stringValue
            WiFiPasswdField.isHidden = true
            WiFiPasswdField1.isHidden = false
            WiFiPasswdField1.becomeFirstResponder()
        }
        if (sender as! NSButton).state.rawValue == 0 {
            print(1)
            WiFiPasswdField.stringValue = WiFiPasswdField1.stringValue
            WiFiPasswdField1.isHidden = true
            WiFiPasswdField.isHidden = false
            WiFiPasswdField.becomeFirstResponder()
        }
    }

    func menuWillOpen(_ menu: NSMenu) {
        if let event = NSApp.currentEvent {
            // 当按下 option 键显示特殊菜单
            guard !event.modifierFlags.contains(.option) else {
                print("Option")
                return
            }
        }
    }
    
    func buildNormalMenu() {
        
    }
    
    func buildOptionMenu() {
        
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


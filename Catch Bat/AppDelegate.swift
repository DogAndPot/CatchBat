//
//  AppDelegate.swift
//  Catch Bat
//
//  Created by 梁怀宇 on 2020/3/20.
//  Copyright © 2020 lhy. All rights reserved.
//

import Cocoa

var statusBar:NSStatusItem!
let WiFiPopup:NSAlert = NSAlert()

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate, NSMenuDelegate {

    var Password:String = ""
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        
        statusBar = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        statusBar.button?.image = NSImage.init(named: "AirPortOff")
        statusBar.button?.image?.isTemplate = true
        statusBar.menu = StatusMenuView.init(title: "")
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    
}

//
//  WiFiList.swift
//  Catch Bat
//
//  Created by 梁怀宇 on 2020/3/24.
//  Copyright © 2020 lhy. All rights reserved.
//

import Foundation
import Cocoa

class WiFiListView: NSView, NSTableViewDelegate, NSTableViewDataSource {
    var wifis: [[String]] = []
    var wifiList: NSTableView?
    
    override init(frame: NSRect) {
        super.init(frame: frame)
        wifiList = NSTableView(frame: NSRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
        wifiList?.rowHeight = 18
        
        let connectColumn = NSTableColumn(identifier: NSUserInterfaceItemIdentifier("connect"))
        connectColumn.headerCell.stringValue = "Connected"
        connectColumn.dataCell = NSTextFieldCell()
        connectColumn.width = 285
        connectColumn.isEditable = false
        wifiList?.addTableColumn(connectColumn)
        
        let ssidColumn = NSTableColumn(identifier: NSUserInterfaceItemIdentifier("ssid"))
        ssidColumn.headerCell.stringValue = "SSID"
        ssidColumn.width = 265
        ssidColumn.isEditable = false
        wifiList?.addTableColumn(ssidColumn)
        
        let lockColumn = NSTableColumn(identifier: NSUserInterfaceItemIdentifier("lock"))
        lockColumn.headerCell.stringValue = "Lock"
        lockColumn.width = 18
        //wifiList?.addTableColumn(lockColumn)
        
        let signalColumn = NSTableColumn(identifier: NSUserInterfaceItemIdentifier("signal"))
        signalColumn.headerCell.stringValue = "Signal"
        signalColumn.width = 18
        //wifiList?.addTableColumn(signalColumn)
        
        wifiList?.dataSource = self
        wifiList?.delegate = self
        
        if let _ = wifiList { addSubview(wifiList!)}
        
        autoresizesSubviews = true
        autoresizingMask = [.width, .height]
        wifiList?.autoresizingMask = [.width, .height]
    }
    
    required init?(coder decoder: NSCoder) {
        super.init(coder: decoder)
    }
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return 3//wifi.count
    }
    
    func tableView(_ tableView: NSTableView, objectValueFor tableColumn: NSTableColumn?, row: Int) -> Any? {
        if tableColumn?.identifier.rawValue == "connect" {
            return NSImage.init(named: "NSMenuOnStateTemplate")
        } else if tableColumn?.identifier.rawValue == "ssid" {
            return "Catch Bat"
        }
        
        return nil
    }
    
    func tableView(_ tableView: NSTableView, setObjectValue object: Any?, for tableColumn: NSTableColumn?, row: Int) {
        return
    }
}

//
//  WiFiMenuItemView.swift
//  Catch Bat
//
//  Created by 梁怀宇 on 2020/4/3.
//  Copyright © 2020 lhy. All rights reserved.
//

import Foundation
import Cocoa


class wifiMenuItemView: NSView {
    var menuItemView: NSVisualEffectView?//NSView?
    var statusImage: NSImageView?
    var ssid: NSTextView?
    var lockImage: NSImageView?
    var signalImage: NSImageView?
    
    override init(frame: NSRect) {
        super.init(frame: frame)
        menuItemView = NSVisualEffectView(frame: NSRect(x: 0, y: 0, width: 285, height: 18))
        menuItemView?.addTrackingRect(menuItemView!.bounds, owner: menuItemView, userData: nil, assumeInside: false)
        menuItemView?.material = .popover
        menuItemView?.isEmphasized = false
        
        statusImage = NSImageView(frame: NSRect(x: 3, y: 0, width: 18, height: 18))
        statusImage?.image = NSImage.init(named: "NSMenuOnStateTemplate")
        statusImage?.image?.isTemplate = true
        menuItemView?.addSubview(statusImage!)
        
        ssid = NSTextView(frame: NSRect(x: 18, y: 0, width: 206, height: 18))
        ssid?.drawsBackground = false
        ssid?.isEditable = false
        ssid?.isSelectable = false
        ssid?.font = NSFont.systemFont(ofSize: 14)
        ssid?.string = "Catch Bat"
        menuItemView?.addSubview(ssid!)
        
        lockImage = NSImageView(frame: NSRect(x: 231, y: 0, width: 18, height: 18))
        lockImage?.image = NSImage.init(named: "NSLockLockedTemplate")
        menuItemView?.addSubview(lockImage!)
        
        signalImage = NSImageView(frame: NSRect(x: 257, y: 0, width: 18, height: 18))
        signalImage?.image = NSImage.init(named: "AirPortInMenu4")
        menuItemView?.addSubview(signalImage!)
        
        if let _ = menuItemView { addSubview(menuItemView!) }
        //if let _ = statusImage { addSubview(statusImage!) }
        //if let _ = ssid { addSubview(ssid!) }
        
        autoresizesSubviews = true
        autoresizingMask = [.width, .height]
        menuItemView?.autoresizingMask = [.width, .height]
    }
    
    override func mouseEntered(with event: NSEvent) {
        print("Mouse Entered")
        menuItemView?.material = .selection
        menuItemView?.isEmphasized = true
        ssid?.textColor = NSColor(deviceRed: 255.0 / 255.0, green: 255.0 / 255.0, blue: 255.0 / 255.0, alpha: 1.0)
    }
    
    override func mouseExited(with event: NSEvent) {
        print("Mouse Exited")
        menuItemView?.material = .popover
        menuItemView?.isEmphasized = false
        ssid?.textColor = NSColor(deviceRed: 0 / 255.0, green: 0 / 255.0, blue: 0 / 255.0, alpha: 1.0)
    }
    
    override func mouseDown(with event: NSEvent) {
        print("Mouse Down")
        menuItemView?.material = .popover
        menuItemView?.isEmphasized = false
        ssid?.textColor = NSColor(deviceRed: 0 / 255.0, green: 0 / 255.0, blue: 0 / 255.0, alpha: 1.0)
    }
    
    override func mouseUp(with event: NSEvent) {
        print("Mouse Up")
        menuItemView?.material = .selection
        menuItemView?.isEmphasized = true
        ssid?.textColor = NSColor(deviceRed: 255.0 / 255.0, green: 255.0 / 255.0, blue: 255.0 / 255.0, alpha: 1.0)
    }
    
    override func draw(_ Rect: NSRect) {
        //NSColor.blue.set()
        //Rect.fill()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
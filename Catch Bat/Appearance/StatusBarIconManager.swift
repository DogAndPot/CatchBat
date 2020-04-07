//
//  StatusBarIconManager.swift
//  Catch Bat
//
//  Created by 梁怀宇 on 2020/4/7.
//  Copyright © 2020 lhy. All rights reserved.
//

import Foundation
import Cocoa

class StatusBarIcon: NSObject {
    static var timer: Timer?
    static var count:Int = 8
    static func on() {
        let queue = DispatchQueue.global(qos: .default)
        queue.async { //[unowned self] in
            self.timer = nil
            self.timer = Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(self.tick), userInfo: nil, repeats: true)
            let currentRunLoop = RunLoop.current
            currentRunLoop.add(self.timer!, forMode: .common)
            currentRunLoop.run()
        }
    }
    
    class func off() {
        if count != 8 {
            count = 0
        }
        statusBar.button?.image = NSImage.init(named: "AirPortOff")
    }
    
    @objc class func tick() {
        DispatchQueue.main.async {
            StatusBarIcon.count -= 1
            switch StatusBarIcon.count {
            case 7:
                statusBar.button?.image = NSImage.init(named: "AirPortScanning1")
                break
            case 6:
                statusBar.button?.image = NSImage.init(named: "AirPortScanning2")
                break
            case 5:
                statusBar.button?.image = NSImage.init(named: "AirPortScanning3")
                break
            case 4:
                statusBar.button?.image = NSImage.init(named: "AirPortScanning4")
                break
            case 3:
                statusBar.button?.image = NSImage.init(named: "AirPortScanning3")
                break
            case 2:
                statusBar.button?.image = NSImage.init(named: "AirPortScanning2")
                break
            case 1:
                statusBar.button?.image = NSImage.init(named: "AirPortScanning1")
                break
            case 0:
                StatusBarIcon.count = 8
                StatusBarIcon.timer?.invalidate()
                statusBar.button?.image = NSImage.init(named: "AirPort4")
                break
            case -1:
                StatusBarIcon.count = 8
                StatusBarIcon.timer?.invalidate()
                statusBar.button?.image = NSImage.init(named: "AirPortOff")
                break
            default:
                return
            }
        }
    }
}

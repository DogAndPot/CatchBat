//
//  WiFi.swift
//  Catch Bat
//
//  Created by 梁怀宇 on 2020/3/23.
//  Copyright © 2020 lhy. All rights reserved.
//

import Foundation

class WiFi {
    static var List = [WiFi]()
    
    class func addWiFI(_ ssid: String, _ connected: Bool, _ encrypted: Bool, _ signal: Int) {
        var wifi = WiFi()
        //WiFi.ssid =
        WiFi.List.append(wifi)
    }
    
    class func count() {
        
    }
}

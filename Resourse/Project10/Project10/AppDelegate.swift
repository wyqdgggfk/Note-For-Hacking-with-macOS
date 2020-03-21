//
//  AppDelegate.swift
//  Project10
//
//  Created by Jason on 2020/3/19.
//  Copyright © 2020 jiangrenandu. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
    
    func addConfigurationMenuItem() {
        let separator = NSMenuItem(title: "Setting", action: #selector(showSettings), keyEquivalent: "")
        let testArray = ["MacBook Pro","MacBook Air","MacBook","iMac","Mac mini","Mac Pro","Thunderbolt","Lightening","Type-C","USB","Mountain Lion"]
        
        statusItem.menu?.addItem(separator)
        for item in testArray {
            let menuItem = NSMenuItem(title: item, action: #selector(showSettings), keyEquivalent: "")
            
            statusItem.menu?.addItem(menuItem)
        }
    }
    @objc func showSettings(_ sender: NSMenuItem){
    }

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        statusItem.button?.title = "Fetching..." // statusbar 的名字
        statusItem.menu = NSMenu() // statusbar 的菜单项
        addConfigurationMenuItem()
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}


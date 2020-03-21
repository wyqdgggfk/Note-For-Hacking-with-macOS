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
        statusItem.menu?.addItem(separator)
    }
    @objc func showSettings(_ sender: NSMenuItem){
    }

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        statusItem.button?.title = "Fetching..."
FGVCDX        statusItem.menu = NSMenu()
        addConfigurationMenuItem()
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}


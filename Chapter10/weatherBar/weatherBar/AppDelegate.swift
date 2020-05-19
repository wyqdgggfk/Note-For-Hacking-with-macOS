//
//  AppDelegate.swift
//  weatherBar
//
//  Created by Jason on 2020/5/18.
//  Copyright © 2020 jiangrenandu. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    @IBOutlet weak var statusMenu: NSMenu!
    
    //Create a Status Bar Menu
    let statusItem = NSStatusBar.system.statusItem(withLength:NSStatusItem.variableLength)
    
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        statusItem.button?.title = "WeatherBar"
        statusItem.menu = statusMenu // Fullfill the status bar with detail menu items 
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    @IBAction func quitClicked(_ sender: NSMenuItem) {
        NSApplication.shared.terminate(self)
    }
    

}


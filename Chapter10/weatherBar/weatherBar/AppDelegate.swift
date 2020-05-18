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

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    @IBAction func quitClicked(_ sender: NSMenuItem) {
    }
    

}


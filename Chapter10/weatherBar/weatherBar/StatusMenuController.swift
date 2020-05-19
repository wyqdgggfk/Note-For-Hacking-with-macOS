//
//  StatusMenuController.swift
//  weatherBar
//
//  Created by Jason on 2020/5/19.
//  Copyright © 2020 jiangrenandu. All rights reserved.
//

import Cocoa

class StatusMenuController: NSObject {
    @IBOutlet weak var statusMenu: NSMenu!
    
    //Create a Status Bar Menu
    let statusItem = NSStatusBar.system.statusItem(withLength:NSStatusItem.variableLength)
    
    override func awakeFromNib() {
        let icon = NSImage(named: "statusIcon")
        icon?.isTemplate = false // best for dark mode
        statusItem.button?.image = icon
        statusItem.menu = statusMenu // Fullfill the status bar with detail menu items
    }
    @IBAction func quitClicked(sender: NSMenuItem) {
        NSApplication.shared.terminate(self)
    }
}

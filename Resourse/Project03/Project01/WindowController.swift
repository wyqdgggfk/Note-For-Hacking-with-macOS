//
//  WindowController.swift
//  Project01
//
//  Created by Jason on 2020/3/17.
//  Copyright © 2020 jiangrenandu. All rights reserved.
//

import Cocoa

class WindowController: NSWindowController {
    
    @IBOutlet var shareButton: NSButton!
    
    override func windowDidLoad() {
        super.windowDidLoad()
        shareButton.sendAction(on: .leftMouseDown)
        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    }

}

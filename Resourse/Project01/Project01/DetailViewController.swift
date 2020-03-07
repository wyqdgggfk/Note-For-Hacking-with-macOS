//
//  DetailViewController.swift
//  Project01
//
//  Created by Jason on 2020/2/29.
//  Copyright © 2020 jiangrenandu. All rights reserved.
//

import Cocoa

class DetailViewController: NSViewController {
    @IBOutlet var imageView: NSImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    func imageSelected(name: String) {
        imageView.image = NSImage(named: name)
    }
}

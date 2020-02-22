//
//  DetailViewController.swift
//  Project01StormView
//
//  Created by Jason on 2020/2/22.
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

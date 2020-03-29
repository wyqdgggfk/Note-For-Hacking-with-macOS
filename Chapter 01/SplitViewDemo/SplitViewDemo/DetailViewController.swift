//
//  DetailViewController.swift
//  SplitViewDemo
//
//  Created by Jason on 2020/3/28.
//  Copyright © 2020 jiangrenandu. All rights reserved.
//

import Cocoa

class DetailViewController: NSViewController {
    @IBOutlet var labelText: NSTextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    func labelChange(country: String) {
        labelText.stringValue = country
    }
}

//
//  ViewController.swift
//  Project09
//
//  Created by Jason on 2020/3/17.
//  Copyright © 2020 jiangrenandu. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    @objc func log(message: String) {
        print("Printing message:\(message)")
    }

}


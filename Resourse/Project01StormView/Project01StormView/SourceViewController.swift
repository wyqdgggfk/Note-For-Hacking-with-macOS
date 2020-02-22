//
//  SourceViewController.swift
//  Project01StormView
//
//  Created by Jason on 2020/2/22.
//  Copyright © 2020 jiangrenandu. All rights reserved.
//

import Cocoa

class SourceViewController: NSViewController, NSTableViewDataSource, NSTableViewDelegate {

    @IBOutlet var tableView: NSTableView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    func numberOfRows(in tableView: NSTableView) -> Int {
        return 100
    }
}

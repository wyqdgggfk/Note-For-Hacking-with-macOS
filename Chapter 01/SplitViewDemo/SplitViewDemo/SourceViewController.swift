//
//  SourceViewController.swift
//  SplitViewDemo
//
//  Created by Jason on 2020/3/28.
//  Copyright © 2020 jiangrenandu. All rights reserved.
//

import Cocoa

class SourceViewController: NSViewController,NSTableViewDataSource,NSTableViewDelegate {
    @IBOutlet var tableView: NSTableView!
    
    let languageList: [String] = ["简体中文","繁體中文","English","Deutsch"," русский язык"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    func numberOfRows(in tableView: NSTableView) -> Int {
        return 100

    }
    
}

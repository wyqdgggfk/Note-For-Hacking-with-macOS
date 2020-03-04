//
//  SourceViewController.swift
//  Project01
//
//  Created by Jason on 2020/2/26.
//  Copyright © 2020 jiangrenandu. All rights reserved.
//

import Cocoa

class SourceViewController: NSViewController,NSTableViewDelegate,NSTableViewDataSource {
    @IBOutlet var tableView: NSTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    // 确定左侧列表有多少行
    func numberOfRows(in tableView: NSTableView) -> Int {
        return 100
    }
    
    // 确定左侧列表每行显示的内容
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        guard let vw = tableView.makeView(withIdentifier: tableColumn!.identifier, owner: self) as? NSTableCellView else {
            return nil
        }
        vw.textField?.stringValue = "Hello World!"
        return vw
    }
}

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
    // The code below defines how many table view cells will there be
    func numberOfRows(in tableView: NSTableView) -> Int {
        return 100
    }
    // The code below defines string value of every tableview cell
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        guard let vw = tableView.makeView(withIdentifier: tableColumn!.identifier, owner: self) as? NSTableCellView else {
            return nil
        }
        vw.textField?.stringValue = "Hello World"
        return vw
    }
}

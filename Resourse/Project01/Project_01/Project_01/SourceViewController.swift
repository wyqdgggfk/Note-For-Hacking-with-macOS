//
//  SourceViewController.swift
//  Project_01
//
//  Created by Jason on 2020/5/23.
//  Copyright © 2020 jiangrenandu. All rights reserved.
//

import Cocoa

class SourceViewController: NSViewController,NSTableViewDataSource,NSTableViewDelegate {
    @IBOutlet weak var tableView: NSTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    // How many rows will show up
    func numberOfRows(in tableView: NSTableView) -> Int {
        return 100
    }
    // what will be shown in every cell
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        guard let vw = tableView.makeView(withIdentifier: tableColumn!.identifier, owner: self) as? NSTableCellView else {return nil}
        vw.textField?.stringValue = "Hello World"
        
        return vw
    }
    
    
}

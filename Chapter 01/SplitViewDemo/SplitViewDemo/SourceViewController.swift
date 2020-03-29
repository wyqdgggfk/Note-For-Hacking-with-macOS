//
//  SourceViewController.swift
//  SplitViewDemo
//
//  Created by Jason on 2020/3/28.
//  Copyright © 2020 jiangrenandu. All rights reserved.
//

import Cocoa

class SourceViewController: NSViewController,NSTableViewDataSource,NSTableViewDelegate {
    
    let languageList: [String] = ["简体中文","繁體中文","English","Deutsch"," русский язык","Le français"]
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    // how many rows will show on the left
    func numberOfRows(in tableView: NSTableView) -> Int {
        return languageList.count
    }
//    what will show on the right
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        guard let vw = tableView.makeView(withIdentifier: tableColumn!.identifier, owner: self) as? NSTableCellView else {
            return nil
        }
        vw.textField?.stringValue = languageList[row]
        return vw
    }

}

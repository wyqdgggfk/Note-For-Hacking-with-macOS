//
//  SourceViewController.swift
//  SplitViewDemo
//
//  Created by Jason on 2020/3/28.
//  Copyright © 2020 jiangrenandu. All rights reserved.
//

import Cocoa

class SourceViewController: NSViewController,NSTableViewDataSource,NSTableViewDelegate {
    
    let languageList: [String] = ["简体中文","繁體中文","English","Deutsch"," русский язык"]
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    func numberOfRows(in tableView: NSTableView) -> Int {
        return languageList.count
    }
    
//    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
//        guard let vw = tableView.makeView(withIdentifier: tableColumn!.identifier, owner: self) as? NSTableCellView else {
//            return nil
//        }
//        vw.textField?.stringValue = languageList[row]
//        return vw
//    }

}

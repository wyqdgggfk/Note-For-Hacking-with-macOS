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
    
//    I should store the languageList in a plist file
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

    func tableViewSelectionDidChange(_ notification: Notification) {
        guard tableView.selectedRow != -1 else { return }
        guard let splitVC = parent as? NSSplitViewController else {return}
        if let detail = splitVC.children[1] as? DetailViewController
        {
            if let source = splitVC.children[0] as? SourceViewController
            {
               let choosedRow = source.tableView.selectedRow
                detail.labelChange(country: languageList[choosedRow])
            }
        }
        
    }
    
}

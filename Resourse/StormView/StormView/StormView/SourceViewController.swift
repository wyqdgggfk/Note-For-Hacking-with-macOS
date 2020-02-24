//
//  SourceViewController.swift
//  StormView
//
//  Created by Jason on 2020/2/23.
//  Copyright © 2020 jiangrenandu. All rights reserved.
//

import Cocoa

class SourceViewController: NSViewController,NSTableViewDelegate,NSTableViewDataSource {
    @IBOutlet var tableView: NSTableView!
    var pictures = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        for item in items{
            if item.hasPrefix("photo") {
                pictures.append(item)
            }
        }
    }
    func numberOfRows(in tableView: NSTableView) -> Int {
        return pictures.count
    }
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        guard let vw = tableView.makeView(withIdentifier: tableColumn!.identifier, owner: self) as? NSTableCellView else {
            return nil
        }
        vw.textField?.stringValue = pictures[row]
        return vw
    }
}

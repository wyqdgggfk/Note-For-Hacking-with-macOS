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
    var pictures = [String]() //创建一个 pictures 数组储存照片的名字
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        for item in items {
            if item.hasPrefix("nssl"){
                pictures.append(item)
            }
        }
        let currentUser = NSFullUserName()
        print(currentUser)
        
    }
    // 确定左侧列表有多少行
    func numberOfRows(in tableView: NSTableView) -> Int {
        return pictures.count
    }
    // 确定左侧列表每行显示的内容
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        guard let vw = tableView.makeView(withIdentifier: tableColumn!.identifier, owner: self) as? NSTableCellView else {
            return nil
        }
        vw.textField?.stringValue = pictures[row]
        return vw
    }
    func tableViewSelectionDidChange(_ notification: Notification) {
        guard tableView.selectedRow != -1 else {return}
        guard let splitVC = parent as? NSSplitViewController else {return}
        if let detail = splitVC.children[1] as? DetailViewController
        {
            detail.imageSelected(name: pictures[tableView.selectedRow])
        }
    }
}

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
    var applications = [String]() //创建一个 applications 数组储存软件的名字
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let fm = FileManager.default
        let path = "/Applications"
        let items = try! fm.contentsOfDirectory(atPath: path)
        for item in items {
            if item.hasSuffix(".app"){
                applications.append(item.replacingOccurrences(of: ".app", with: ""))
            }
            
        }
        
        
    }
    // 确定左侧列表有多少行
    func numberOfRows(in tableView: NSTableView) -> Int {
        return applications.count
    }
    
    // 确定左侧列表每行显示的内容
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        guard let vw = tableView.makeView(withIdentifier: tableColumn!.identifier, owner: self) as? NSTableCellView else {
            return nil
        }
        vw.textField?.stringValue = applications[row]
        return vw
    }
}

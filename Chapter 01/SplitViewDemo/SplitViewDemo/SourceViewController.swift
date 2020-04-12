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
    var languageList:[String] = []
    var languageDictionary:[String:String] = [:]
//    let languageSourcePlist = Bundle.main.path(forResource: "languageList", ofType: "plist")
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        read the plist in my code
        let languageDic = Bundle.main.path(forResource: "languageList",ofType:"plist")
        let dic = NSDictionary(contentsOfFile: languageDic!)
        for (key,value) in dic!
        {
            languageDictionary.updateValue(value as! String, forKey: key as! String)
        }
        
        for key in languageDictionary.keys {
            languageList.append(key)
        }
    }
    // how many rows will show on the left
    func numberOfRows(in tableView: NSTableView) -> Int {
        return languageDictionary.count
    }
//    what will show on the right
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        guard let vw = tableView.makeView(withIdentifier: tableColumn!.identifier, owner: self) as? NSTableCellView else {
            return nil
        }
        vw.textField?.stringValue = languageList[row]
        return vw
    }

    func  (_ notification: Notification) {
        guard tableView.selectedRow != -1 else { return }
        guard let splitVC = parent as? NSSplitViewController else {return}
        if let detail = splitVC.children[1] as? DetailViewController
        {
            detail.labelChange(country: languageDictionary[languageList[tableView.selectedRow]]!)
        }
    }
}

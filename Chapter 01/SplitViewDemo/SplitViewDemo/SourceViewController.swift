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
//    let languageList: [String] = ["简体中文","繁體中文","English","Deutsch"," русский язык","Le français"]
    let languageDictionary = ["简体中文":"凤凰台上凤凰游，凤去台空江自流。" + "\n" + "吴宫花草埋幽径，晋代衣冠成古丘。" + "\n" + "三山半落青天外，二水中分白鹭洲。" + "\n" + "总为浮云能蔽日，长安不见使人愁。",
                              "繁體中文":"飛雪連天射白鹿,笑書神俠倚碧鴛",
                              "English":"e hold these truths to be self-evident, that all men are created equal, that they are endowed by their Creator with certain unalienable Rights, that among these are Life, Liberty, and the pursuit of Happiness.",
                              "Deutsch":"Sonne kann nicht ohne Schein, Mensch nicht ohne Liebe sein.",
                              "русский язык":"где есть жизнь, есть счастье",
                              "Le français":"Je ne suis pas d'accord avec ce que vous dites, mais je me battrai jusqu'à la mort pour que vous ayez le droit de le dire."]
   
    var languageList:[String] = []
    var languageDictionary2:[Dictionary] = []
    
    let languageSourcePlist = Bundle.main.path(forResource: "languageList", ofType: "plist")
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for key in languageDictionary.keys {
            languageList.append(key)
        }
        
//        read the plist in my code
        let languageDic = Bundle.main.path(forResource: "languageList",ofType:"plist")
        let dic = NSDictionary(contentsOfFile: languageDic!)
        for key in dic!.allKeys {
            print(dic![key] ?? "")
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

    func tableViewSelectionDidChange(_ notification: Notification) {
        guard tableView.selectedRow != -1 else { return }
        guard let splitVC = parent as? NSSplitViewController else {return}
        if let detail = splitVC.children[1] as? DetailViewController
        {
            detail.labelChange(country: languageDictionary[languageList[tableView.selectedRow]]!)
        }
        
    }
    
}

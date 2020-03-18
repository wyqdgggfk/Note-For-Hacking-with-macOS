//
//  ViewController.swift
//  Project09
//
//  Created by Jason on 2020/3/17.
//  Copyright © 2020 jiangrenandu. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        runBackgroundCode1()
        runBackgroundCode2()
        runBackgroundCode4()
        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    @objc func log(message: String) {
        print("Printing message:\(message)")
    }
    func runBackgroundCode1() {
        performSelector(inBackground: #selector(log), with: "Hello world 1")
        performSelector(onMainThread: #selector(log), with: "Hello world 2", waitUntilDone: false)
        log(message: "Hello world 3")
    }
    func runBackgroundCode2() {
        DispatchQueue.global().async {
            [unowned self] in self.log(message: "On background thread")
            DispatchQueue.main.async {
                self.log(message: "On main thread")
            }
        }
    }
    func runBackgroundCode3() {
        DispatchQueue.global().async {
            guard let url = URL(string: "https://www.apple.com") else { return }
            guard let str = try? String(contentsOf: url) else { return }
            print(str)
        }
    }
    func runBackgroundCode4() {
        DispatchQueue.global(qos: .userInteractive).async {
            [unowned self] in self.log(message: "This is high priority")
        }
    }
}


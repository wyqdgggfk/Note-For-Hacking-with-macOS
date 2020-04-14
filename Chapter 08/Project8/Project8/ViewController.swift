//
//  ViewController.swift
//  Project8
//
//  Created by Jason on 2020/4/14.
//  Copyright © 2020 jiangrenandu. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    var visualEffectView: NSVisualEffectView!
    var gridViewButtons = [NSButton]()
    let gridSize = 10
    let gridMargin:CGFloat = 5
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func loadView() {
        super.loadView()
        
        visualEffectView = NSVisualEffectView()
        visualEffectView.translatesAutoresizingMaskIntoConstraints = false
        
        // enable the dark vibrancy effect
        visualEffectView.material = .mediumLight
        
        // force it to remain active even when the window loses focus
        visualEffectView.state = .active
        view.addSubview(visualEffectView)
        
        //pin it to the edges of our window
        visualEffectView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        visualEffectView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        visualEffectView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        visualEffectView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}


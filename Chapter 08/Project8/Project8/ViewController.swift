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
        visualEffectView.material = .dark
        
        // force it to remain active even when the window loses focus
        visualEffectView.state = .active
        view.addSubview(visualEffectView)
        
        //pin it to the edges of our window
        visualEffectView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        visualEffectView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        visualEffectView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        visualEffectView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
    }
    
    func createTitle() -> NSTextField {
        let titleString = "Odd One Out"
        let title = NSTextField(labelWithString: titleString)
        title.font = NSFont.systemFont(ofSize: 36,weight: .thin)
        title.textColor = NSColor.green
        title.translatesAutoresizingMaskIntoConstraints = false
        
        visualEffectView.addSubview(title)
        title.topAnchor.constraint(equalTo: visualEffectView.topAnchor,constant: gridMargin).isActive = true
        title.centerXAnchor.constraint(equalTo: visualEffectView.centerXAnchor).isActive = true
        return title
        
    }
    
    
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}


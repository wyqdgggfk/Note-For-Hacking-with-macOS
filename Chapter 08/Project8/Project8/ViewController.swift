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
    let gridMargin:CGFloat = 50
    

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
        createTitle()
    }
    
    func createTitle() -> NSTextField {
        let titleString = "Odd One Out"
        let title = NSTextField(labelWithString: titleString)
        title.font = NSFont.init(name: "Chalkduster", size: 30) // This step can use different system owned font
        title.textColor = NSColor.black
        title.translatesAutoresizingMaskIntoConstraints = false
        
        visualEffectView.addSubview(title)
        title.topAnchor.constraint(equalTo: visualEffectView.topAnchor,constant: gridMargin).isActive = true
        title.centerXAnchor.constraint(equalTo: visualEffectView.centerXAnchor).isActive = true
        return title
        }
    
    func createButtonArray() -> [[NSButton]] {
        var rows = [[NSButton]]()
        for _ in 0 ..< gridSize {
            var row = [NSButton]()
            for _ in 0 ..< gridSize {
                let button = NSButton(frame: NSRect(x: 0, y: 0, width: 64, height: 64))
                button.image = NSImage(named: "penguin")
                button.setButtonType(.momentaryChange)
                button.imagePosition = .imageOnly
                button.focusRingType = .none
                button.isBordered = false
                
                //button.action = #selector(imageClicked)
                button.target = self
                gridViewButtons.append(button)
                row.append(button)
            }
            rows.append(row)
        }
        return rows
    }
    
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}


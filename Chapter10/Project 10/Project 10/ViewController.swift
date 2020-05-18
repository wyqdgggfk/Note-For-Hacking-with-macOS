//
//  ViewController.swift
//  Project 10
//
//  Created by Jason on 2020/5/17.
//  Copyright © 2020 jiangrenandu. All rights reserved.
//

import Cocoa
import MapKit

class ViewController: NSViewController {
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet var apiKey: NSTextField!
    @IBOutlet var statusBarOption: NSPopUpButton!
    @IBOutlet var units: NSSegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear() {
        super.viewWillAppear()
        
        let defaults = UserDefaults.standard
        let savedLatitude = defaults.double(forKey: "latitude")
        let savedLongitude = defaults.double(forKey: "longitude")
        let savedAPIKey = defaults.string(forKey: "apiKey") ?? ""
        let savedStatusBar = defaults.integer(forKey: "statusBarOption")
        let savedUnits = defaults.integer(forKey: "units")
        
        apiKey.stringValue = savedAPIKey
        units.selectedSegment = savedUnits
        //2
        for menuItem in statusBarOption.menu!.items {
            if menuItem.tag == savedStatusBar {
                statusBarOption.select(menuItem)
            }
        }
        //3
        //4
    }
    

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func showPoweredBy(_ sender: NSButton) {
    }
    
}


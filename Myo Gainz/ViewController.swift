//
//  ViewController.swift
//  Myo Gainz
//
//  Created by Domingo on 2016-01-23.
//  Copyright © 2016 Myo Something. All rights reserved.
//

import UIKit

class ViewController: TLMSettingsViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Data notifications are received through NSNotificationCenter.
        // Posted whenever a TLMMyo connects
        
        //REMOVE THE FOLLOWING LINE AFTER TESTING!!
        //performSegueWithIdentifier("myoConnected", sender: self)
        performSegueWithIdentifier("myoConnected", sender: self)
        NSNotificationCenter .defaultCenter() .addObserver(self, selector: "didConnectDevice:", name: TLMHubDidConnectDeviceNotification, object: nil)
        
        //Do not use the following line unless testing PumpingVC
        //performSegueWithIdentifier("goToPumping", sender: self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func pushMyoSettings() {
        navigationController?.pushViewController(self, animated: true)
    }
    
    func didConnectDevice (notification : NSNotification) {
        // Access the connected device.
        let myo = notification.userInfo![kTLMKeyMyo]
        if let my = myo {
            print("Connected to \(my.name)")
            performSegueWithIdentifier("myoConnected", sender: self)
        }
        
    }
    
    
}
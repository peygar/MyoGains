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

        NSNotificationCenter .defaultCenter() .addObserver(self, selector: "didReceivePoseChange:", name: TLMMyoDidReceivePoseChangedNotification, object: nil)
        
        NSNotificationCenter .defaultCenter() .addObserver(self, selector: "didReceiveOrientationEvent:", name: TLMMyoDidReceiveOrientationEventNotification, object: nil)
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
        print("HI")
        print("Connected to \(myo!.name)")
    }
    
    func didReceivePoseChange (notification: NSNotification) {
        let pose = notification.userInfo![kTLMKeyPose]
        print ("Pose \(pose)")
        
    }
    
    func didReceiveOrientationEvent (notification : NSNotification) {
        let orientation = notification.userInfo![kTLMKeyOrientationEvent]
        if let or = orientation{
            print ("Orientation \(or)")
        }
    }


}
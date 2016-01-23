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
        NSNotificationCenter .defaultCenter() .addObserver(self, selector: "didReceivePoseChange", name: TLMMyoDidReceivePoseChangedNotification, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func pushMyoSettings() {
        navigationController?.pushViewController(self, animated: true)
    }
    
    func didReceivePoseChange (notification: NSNotification) {
        let pose = notification.userInfo![kTLMKeyPose]
        print (pose)
    }


}
//
//  PumpingViewController.swift
//  Myo Gainz
//
//  Created by Domingo on 2016-01-23.
//  Copyright © 2016 Myo Something. All rights reserved.
//

import UIKit

class PumpingViewController: UIViewController {
    
    @IBOutlet var repsCounter: UILabel!
    
    @IBOutlet var finishedLabel: UILabel!
    
    @IBOutlet var grabBarLabel: UILabel!
    
    private var press: Press!
    
    private var doneLifting: Bool!
    
    private var weightsUp: Bool! //indicates the user has grabbed weights

    override func viewDidLoad() {
        super.viewDidLoad()
        
        doneLifting = false
        weightsUp = false
        press = Press (g: 5, vc1: self)
        finishedLabel.hidden = true

        TLMHub.sharedHub().myoDevices()[0] .unlockWithType(TLMUnlockType.Hold)
        
        NSNotificationCenter .defaultCenter() .addObserver(self, selector: "didReceiveAccelerometerEvent:", name: TLMMyoDidReceiveAccelerometerEventNotification, object: nil)
        
        NSNotificationCenter .defaultCenter() .addObserver(self, selector: "didReceivePoseChangedEvent:", name: TLMMyoDidReceivePoseChangedNotification, object: nil)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func finishedWorkout() {
        
        let formatter = NSDateFormatter()
        formatter.timeStyle = .FullStyle
        let dateString = formatter.stringFromDate(NSDate())
        
        let file = "file.txt" 
        
        let text = "\((repsCounter.text)!) reps on \(formatter.stringFromDate(NSDate()))"
        
        if let dir : NSString = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.AllDomainsMask, true).first {
            let path = dir.stringByAppendingPathComponent(file);
            
            //writing
            do {
                try text.writeToFile(path, atomically: false, encoding: NSUTF8StringEncoding)
            }
            catch {/* error handling here */}
            
            //reading
            do {
                let text2 = try NSString(contentsOfFile: path, encoding: NSUTF8StringEncoding)
                print(text2)
            }
            catch {/* error handling here */}
        }
    }
    
    func didReceiveAccelerometerEvent (notification: NSNotification) {
        if (weightsUp == true){
            press.determineDirection(notification)
        }
    }
    
    func didReceivePoseChangedEvent (notification: NSNotification) {
        let pose :TLMPose = notification.userInfo![kTLMKeyPose] as! TLMPose
        
        if (pose.type == TLMPoseType.Fist && !doneLifting && !weightsUp) {
            //user starts grabbing bar
            press.startGrabbing()
        }
        
        if (pose.type == TLMPoseType.WaveIn && doneLifting == true && !weightsUp) {
            //wave in gesture. User does another set
            resetPress()
        }
    }
    
    func weightsUpYes () {
        weightsUp = true
    }
    
    func sendVibration (length: TLMVibrationLength) {
        TLMHub.sharedHub().myoDevices()[0].vibrateWithLength(length)
    }
    
    func finishLifting () {
        sendVibration(TLMVibrationLength.Long)
        doneLifting = true
        weightsUp = false
        finishedLabel.hidden = false
        finishedWorkout()
    }
    
    func resetPress() {
        doneLifting = false
        weightsUp = false
        finishedLabel.hidden = true
        press = Press(g: 5, vc1: self)
        repsCounter.text = "0"
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
}

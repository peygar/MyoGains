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
    
    private var setCounter: UInt32!
    
    private var press: Press!
    
    private var doneLifting: Bool!
    
    var goal: UInt?
    
    private var weightsUp: Bool! //indicates the user has grabbed weights

    override func viewDidLoad() {
        super.viewDidLoad()
        if let _ = goal {}
        else {
            goal = 5
        }
        doneLifting = false
        weightsUp = false
        press = Press (g: goal!, vc1: self)
        repsCounter.text = "0"
        finishedLabel.hidden = true
        setCounter = 0

        TLMHub.sharedHub().myoDevices()[0] .unlockWithType(TLMUnlockType.Hold)
        
        NSNotificationCenter .defaultCenter() .addObserver(self, selector: "didReceiveAccelerometerEvent:", name: TLMMyoDidReceiveAccelerometerEventNotification, object: nil)
        
        NSNotificationCenter .defaultCenter() .addObserver(self, selector: "didReceivePoseChangedEvent:", name: TLMMyoDidReceivePoseChangedNotification, object: nil)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func saveWorkout() {
        
        let formatter = NSDateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        let file = "file.txt" 

        setCounter!++
        
        let text = "\(setCounter) sets of \((repsCounter.text)!) reps on \(formatter.stringFromDate(NSDate()))"

        
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
        saveWorkout()
    }
    
    func resetPress() {
        doneLifting = false
        weightsUp = false
        finishedLabel.hidden = true
        grabBarLabel.hidden = false
        press = Press(g: goal!, vc1: self)
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

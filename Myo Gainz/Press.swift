//
//  Press.swift
//  Myo Gainz
//
//  Created by Domingo on 2016-01-23.
//  Copyright © 2016 Myo Something. All rights reserved.
//

import Foundation

class Press: NSObject {
    
    //delay
    private let delay :UInt32 = 6
    
    //physics constants and variables
    private let tolerance : Float = 0.06
    private let relativityOffset : Float = 0.95 //offset acceleration
    private let maxConsecutiveDown : UInt32 = 6
    private var consecutiveDown: UInt32 = 6 //number of times that errors are allowed when determing direction of movements
    
    
    //general constants and variables
    private var liftingUp: Bool //indicates the weights are being lifted upward
    private let goal : UInt
    private var counter: UInt
    
    //PumpingViewController reference
    private let vc :PumpingViewController
    
    
    init (g:UInt, vc1: PumpingViewController) {
        liftingUp = false
        goal = g
        counter = 0
        vc = vc1
    }
    
    
    //Should be called when pose is changed to "fist"
    //Main function that keeps the loop running and checks for downward motion
    func startGrabbing () {
        
        //Vibrate twice to let user know the set is starting
        vc.sendVibration(TLMVibrationLength.Short)
        vc.sendVibration(TLMVibrationLength.Short)
        
        //start lifting
        //liftingUp = true
        vc.weightsUpYes()
        print("Lifting started")
    }
    
    func determineDirection (notification :NSNotification) {
        var direction :Int //1=up; -1=down; 0=stable
        
        //Determine direction of motion. Accounts error resulted from shaking
        let acc = getAccel(notification)
        
        //print(acc)
        if (acc > tolerance) {
            direction = -1
            consecutiveDown--
            print ("Moving down")
        }
        else if (acc < -tolerance) {
            direction = 1
            consecutiveDown--
            print ("Moving up")
        }
        else {
            direction = 0
            consecutiveDown = maxConsecutiveDown
            print ("Stable")
        }
        
        //Determine direction based on errors
        if (consecutiveDown == 0) {
            if (liftingUp && direction == -1) {
                liftingUp = false
                addOne()
            }
            else if (!liftingUp && direction == 1) {
                liftingUp = true
            }
            consecutiveDown = maxConsecutiveDown
        }
        
    }
    
    //increase counter in the Press object and the label in vc
    private func addOne () {
        counter++
        vc.repsCounter.text = "\(counter)"
        if (counter >= goal) {
            print("Lifting finished")
            vc.finishLifting()
        }
    }
    
    //returns the acceleration given by Myo
    private func getAccel (notification: NSNotification) -> Float {
        //calculations to return a nicely formatted acceleration to work with
        var x = notification.userInfo![kTLMKeyAccelerometerEvent]!.vector.x + relativityOffset
        x *= 100
        x = floor(x + 0.5) / 100.0
        return x
    }
    
    
}
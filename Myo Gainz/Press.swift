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
    private let delay :UInt32 = 5
    
    //physics constants and variables
    private let tolerance : Float = 0.06
    private let relativityOffset : Float = 0.95 //offset acceleration
    private let maxConsecutiveDown : UInt32 = 6
    private var consecutiveDown: UInt32 = 6 //number of times that errors are allowed when determing direction of movements
    
    
    //general constants and variables
    private var weightsUp: Bool //indicates the user has grabbed weights
    private var liftingUp: Bool //indicates the weights are being lifted upward
    private let goal : UInt
    private var counter: UInt
    
    //myo constant (references)
    private let myoNotification : NSNotification
    private let myo : TLMMyo
    
    //PumpingViewController reference
    private let vc :PumpingViewController
    
    
    init (g:UInt, mn: NSNotification, vc1: UIViewController) {
        weightsUp = false
        liftingUp = false
        goal = g
        counter = 0
        myoNotification = mn
        myo = myoNotification.userInfo![kTLMKeyMyo] as! TLMMyo
        vc = vc1
    }
    
    
    //Should be called when pose is changed to "fist"
    //Main function that keeps the loop running and checks for downward motion
    func startGrabbing () {
        if (!weightsUp) {
            weightsUp = true
            //pause program
            sleep(delay)
        }
        
        //Vibrate twice to let user know the set is starting
        myo.vibrateWithLength(TLMVibrationLength.Short)
        myo.vibrateWithLength(TLMVibrationLength.Short)
        
        //start lifting
        liftingUp = true
        print("loop starts")
        repeat {
            determineDirection()
        }
            while (counter < goal);
        print("loop ends")
        reset()
        
        //One long vibration to let user know the set is complete
        myo.vibrateWithLength(TLMVibrationLength.Long)
    }
    
    private func determineDirection () {
        var direction :Int //1=up; -1=down; 0=stable
        
        //Determine direction of motion. Accounts error resulted from shaking
        let acc = getAccel()
        
        
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
                consecutiveDown = maxConsecutiveDown
            }
            else if (!liftingUp && direction == 1) {
                liftingUp = true
                consecutiveDown = maxConsecutiveDown
            }
        }
    }
    
    //resets certain variables to their initial states
    private func reset () {
        weightsUp = false
        liftingUp = false
        counter = 0
        consecutiveDown = maxConsecutiveDown
    }
    
    //increase counter in the Press object and the label in vc
    private func addOne () {
        counter++
        vc.repsCounter.text = "\(counter)"
    }
    
    //returns the acceleration given by Myo
    private func getAccel () -> Float {
        //calculations to return a nicely formatted acceleration to work with
        var x = myoNotification.userInfo![kTLMKeyAccelerometerEvent]!.vector.x + relativityOffset
        x *= 100
        x = floor(x + 0.5) / 100.0
        return x
    }
    
    
}
//
//  Press.swift
//  Myo Gainz
//
//  Created by Domingo on 2016-01-23.
//  Copyright © 2016 Myo Something. All rights reserved.
//

import Foundation

class Press: NSObject {
    private let delay = UInt32(5)
    
    private var weightsUp :Bool
    private var liftingUp: Bool
    private var goal : UInt
    private var counter: UInt
    
    private var myo : TLMMyo
    
    init (g:UInt) {
        weightsUp = false
        liftingUp = false
        goal = g
        counter = 0
        myo = TLMHub.sharedHub().myoDevices()[0] as! TLMMyo
    }
    
    
    //Should be called when pose is changed to "fist"
    func startGrabbing () -> UInt {
        if (!weightsUp) {
            weightsUp = true
            //pause program
            sleep(delay)
        }
        
        //Vibrate to let user know the set is starting
        myo.vibrateWithLength(TLMVibrationLength.Short)
        myo.vibrateWithLength(TLMVibrationLength.Short)
        
        //start lifting
        liftingUp = true
        print("loop starts")
        repeat {
            loop ()
        }
            while (counter < goal);
        print("loop ends")
        reset()
        
        //Vibrate to let user know the set is complete
        myo.vibrateWithLength(TLMVibrationLength.Short)
        myo.vibrateWithLength(TLMVibrationLength.Short)
        
        return getRepsCount()
    }
    
    private func loop () {
        if (!liftingUp) {
            counter++;
            liftingUp = true
        }
        //Peyman's code to check downward movement
    }
    
    private func reset () {
        weightsUp = false
        liftingUp = false
        counter = 0
    }
    
    private func getRepsCount() -> UInt {
        return counter
    }
    
}
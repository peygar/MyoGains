//
//  PumpingViewController.swift
//  Myo Gainz
//
//  Created by Domingo on 2016-01-23.
//  Copyright © 2016 Myo Something. All rights reserved.
//

import UIKit
import CoreData
import Foundation

class PumpingViewController: UIViewController {
    
    @IBOutlet var repsCounter: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let workout = NSEntityDescription.insertNewObjectForEntityForName("Workout", inManagedObjectContext: self.managedObjectContext) as! PumpingWorkout //how the hell do you make this unique?

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func finishedWorkout() {
        
        do {
            try self.managedObjectContext.save()
        } catch {
            fatalError("Failure to save context: \(error)")
        }
        
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

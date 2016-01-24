//
//  WorkoutsTableView.swift
//  Myo Gainz
//
//  Created by Peyman Halfmoon on 2016-01-24.
//  Copyright © 2016 Myo Something. All rights reserved.
//

import UIKit
import Foundation

class WorkoutsTableView: UITableViewController {

    @IBOutlet weak var setRepsButton: UIBarButtonItem!
    var workouts : [String]?
    var workoutType : ExerciseType?

    enum ExerciseType : String {
        case Shoulders = "Shoulders"
        case Chest = "Chest"
        case Back = "Back"
        case Biceps = "Biceps"
        case Triceps = "Triceps"
    }
    
    func setExerciseType(type : ExerciseType) {
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        workouts = ["Shoulder Press"]
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (workouts?.count)!
        
    }

    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80.0
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("workoutCell", forIndexPath: indexPath)
        cell.textLabel?.text = workouts![indexPath.row]
        cell.detailTextLabel?.text = "Sets 3, Reps 5"
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("startExercise", sender: self)
    }
    
    @IBAction func setReps(sender: UIBarButtonItem) {
        performSegueWithIdentifier("setReps", sender: self)
    }
}

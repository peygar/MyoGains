//
//  WorkoutsTableView.swift
//  Myo Gainz
//
//  Created by Peyman Halfmoon on 2016-01-24.
//  Copyright © 2016 Myo Something. All rights reserved.
//

import UIKit

class WorkoutsTableView: UITableViewController {

    var workouts : [String]?
    var workoutType : ExerciseType?
    
    enum ExerciseType : String {
        case Chest = "Chest"
        case Legs = "Legs"
        case Arms = "Arms"
    }
    
    func setExerciseType(type : ExerciseType) {
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        workouts = ["Chest Press"]
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

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("banana", forIndexPath: indexPath)
        
        cell.textLabel?.text = workouts?[indexPath.row]

        return cell
    }
    override func tableView(tableView: UITableView, titleForFooterInSection section: Int) -> String? {
         return "Section \(section)"
    }
}

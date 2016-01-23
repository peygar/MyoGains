//
//  SetRepsTableViewController.swift
//  Myo Gainz
//
//  Created by Matthew Dias on 2016-01-23.
//  Copyright © 2016 Myo Something. All rights reserved.
//

import UIKit

class SetRepsTableViewController: UITableViewController {
    @IBOutlet weak var workoutLabel: UILabel!
    @IBOutlet weak var repsLabel: UILabel!
    
    var workoutType = Int()

    override func viewDidLoad() {
        super.viewDidLoad()

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
        // #warning Incomplete implementation, return the number of sections
        return 3
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 3
    }
    
    override func tableView( tableView : UITableView,  titleForHeaderInSection section: Int)->String {
        switch(section) {
            
        case 1:return "Interval 1"
        case 2:return "Interval 2"
        case 3:return "Interval 3"
        default :return ""
        }
    }
    
    override func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 20.0
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("repCell", forIndexPath: indexPath) as! setRepsTableViewCell
        
        // Configure the cell...
        switch workoutType {
        case 1:
            switch indexPath.row {
            case 1:
                cell.detailTextLabel?.text = "Shoulder Press"
            case 2:
                cell.detailTextLabel?.text = "Lateral Raises"
            case 3:
                cell.detailTextLabel?.text = "Front Raises"
            default:
                break;
            }
        case 2:
            switch indexPath.row {
            case 1:
                cell.detailTextLabel?.text = "Shoulder Press"
            case 2:
                cell.detailTextLabel?.text = "Lateral Raises"
            case 3:
                cell.detailTextLabel?.text = "Front Raises"
            default:
                break;
            }
        case 3:
            switch indexPath.row {
            case 1:
                cell.detailTextLabel?.text = "Shoulder Press"
            case 2:
                cell.detailTextLabel?.text = "Lateral Raises"
            case 3:
                cell.detailTextLabel?.text = "Front Raises"
            default:
                break;
            }
        default:
            break;
        }
        return cell
    }

}

//
//  WorkoutListTableViewController.swift
//  Myo Gainz
//
//  Created by Domingo on 2016-01-23.
//  Copyright © 2016 Myo Something. All rights reserved.
//

import UIKit

class WorkoutListTableViewController: UITableViewController {
    
    var workoutType = Int()
    var workoutArray = [String()]
    /*enum ExerciseType {
    case chest
    case shoulder
    case leg
    }*/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        self.navigationItem.title = workoutArray[workoutType]
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView( tableView : UITableView,  titleForHeaderInSection section: Int)->String {
        //set a header at the top of each section
        switch(section) {
            
        case 1:return "Interval 1"
        case 2:return "Interval 2"
        case 3:return "Interval 3"
        default :return ""
        }
    }
    
    override func tableView(tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        //set a footer at the bottom of the tableView
        switch(section) {
        case 1:return ""
        case 2:return ""
        case 3:return "Tap your fingers twice to skip exercises"
        default :return ""
        }
    }
<<<<<<< Updated upstream

    /*override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        switch indexPath.section {
        case 1:
            switch indexPath.row {
            case 1:
                performSegueWithIdentifier("workout1", sender: self)
            default:
                break;
                
            }
        default:
            break;
        }
        
=======
    
    /*override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    switch indexPath.section {
    case 1:
    switch indexPath.row {
    case 1:
    performSegueWithIdentifier("workout1", sender: self)
    default:
    break;
    
    }
    default:
    break;
    }
    
>>>>>>> Stashed changes
    }*/
    
    override func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 20.0
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! WorkoutListTableViewCell
<<<<<<< Updated upstream

=======
        
>>>>>>> Stashed changes
        // configure workoutLabel text based on the exercise type selected
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
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        //pass workoutType data to the SetRepsTableViewController
        let DestViewController : SetRepsTableViewController = segue.destinationViewController as! SetRepsTableViewController
        DestViewController.workoutType = workoutType
    }
    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return false if you do not want the specified item to be editable.
    return true
    }
    */
    
    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    if editingStyle == .Delete {
    // Delete the row from the data source
    tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
    } else if editingStyle == .Insert {
    // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
    }
    */
    
    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
    
    }
    */
    
    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return false if you do not want the item to be re-orderable.
    return true
    }
    */
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
}
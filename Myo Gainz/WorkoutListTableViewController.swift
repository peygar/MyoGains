//
//  WorkoutListTableViewController.swift
//  Myo Gainz
//
//  Created by Domingo on 2016-01-23.
//  Copyright © 2016 Myo Something. All rights reserved.
//

import UIKit

class WorkoutListTableViewController: UITableViewController {
    
    var workoutType : ExerciseType?
    var workouts : [String]?
    
    enum ExerciseType : String {
        case Chest = "Chest"
        case Arms = "Arms"
        case Legs = "Legs"
    }


    
    func setExerciseType(type: ExerciseType){
        workoutType = type
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        workouts = ["Chest Press"]
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        if let fuck = workoutType {
            self.navigationItem.title = fuck.rawValue
        }
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
    
    /*override func tableView( tableView : UITableView,  titleForHeaderInSection section: Int)->String {
        //set a header at the top of each section
        switch(section) {
    
        case 1:return "Interval 1"
        case 2:return "Interval 2"
        case 3:return "Interval 3"
        default :return ""
        }
    }*/
    
    /*override func tableView(tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        //set a footer at the bottom of the tableView
        switch(section) {
        case 1:return ""
        case 2:return ""
        case 3:return "Tap your fingers twice to skip exercises"
        default :return ""
        }
    }
    }*/

  /*  override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
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

    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        
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
    }

    override func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 20.0
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("workoutCell", forIndexPath: indexPath) as! WorkoutListTableViewCell
//        let cell : WorkoutListTableViewCell
//        if let myCell = tempCell {
//            cell = myCell as! WorkoutListTableViewCell
//        } else {
//            cell = WorkoutListTableViewCell()
//        }
        
        // configure workoutLabel text based on the exercise type selected
//        if let type = workoutType{
            cell.titleLabel?.text = workouts![indexPath.row]
//        }
//        switch type {
//            case .Chest:
//                switch indexPath.row {
//                case 0:
//                    cell.titleLabel.text = "Shoulder Press"
//                    break;
//                case 1:
//                    cell.titleLabel.text = "Lateral Raises"
//                    break;
//                case 2:
//                    cell.titleLabel.text = "Front Raises"
//                    break;
//                default:
//                    break;
//                }
//            case .Arms:
//                switch indexPath.row {
//                case 0:
//                    cell.titleLabel.text = "Dick Press"
//                case 1:
//                    cell.titleLabel.text = "Dick Raises"
//                case 2:
//                    cell.titleLabel.text = "Front Dick"
//                default:
//                    break;
//                }
//            case .Legs:
//                switch indexPath.row {
//                case 0:
//                    cell.titleLabel.text = "Shoulder Press"
//                case 1:
//                    cell.titleLabel.text = "Lateral Raises"
//                case 2:
//                    cell.titleLabel.text = "Front Raises"
//                default:
//                    break;
//                }
//
//            }
//        }
        return cell
    }
    
    /*override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        //pass workoutType data to the SetRepsTableViewController
        let DestViewController : SetRepsTableViewController = segue.destinationViewController as! SetRepsTableViewController
        DestViewController.workoutType = workoutType
    }*/
    
    
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
*/
}
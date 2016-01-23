//
//  MuscleGroupCollectionViewController.swift
//  Myo Gainz
//
//  Created by Matthew Dias on 2016-01-23.
//  Copyright © 2016 Myo Something. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"
private var workoutArray = [String()]
private var fitnessArray = [UIImage]()

class MuscleGroupCollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        fitnessArray = [UIImage(named: "Shoulders")!, UIImage(named: "Chest")!, UIImage(named: "Back")!, UIImage(named: "Arms")!, UIImage(named: "Legs")!, UIImage(named: "Abs")!]
        workoutArray = ["Shoulders", "Chest", "Back", "Arms", "Legs", "Abs"]

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return fitnessArray.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! MuscleGroupsCollectionViewCell
       
        //uncomment this once an image set is loaded
        //cell.imageView?.image = fitnessArray[indexPath.row]
        
        cell.frame = CGRectMake(cell.frame.origin.x, cell.frame.origin.y, cell.frame.size.width, cell.frame.size.height)
        return cell

    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        //set the size of each collectionView cell (100 px x 100 px)
        return CGSizeMake(100, 100)
        
    }
    
    override func collectionView(collectionView: UICollectionView, didDeselectItemAtIndexPath indexPath: NSIndexPath){
        //perform segue when collectionView cell selected
        self.performSegueWithIdentifier("workoutList", sender: self)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let indexPaths = self.collectionView!.indexPathsForSelectedItems()!
        let indexPath = indexPaths[0] as NSIndexPath
        
        let DestViewController : WorkoutListTableViewController = segue.destinationViewController as! WorkoutListTableViewController
        DestViewController.workoutType = indexPath.row
        DestViewController.workoutArray = workoutArray
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
    
    }
    */

}

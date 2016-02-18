//
//  ViewController.swift
//  College Profile Builder
//
//  Created by Student on 1/20/16.
//  Copyright © 2016 Student. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    @IBOutlet weak var tableView: UITableView!
    var colleges : [College] = []

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        colleges.append(College(Name: "Harvard", Location: "Cambridge", Students: 21000, Picture: UIImage(named: "Harvard")!))
        colleges.append(College(Name: "University Of Illinois", Location: "Chicago", Students: 27589, Picture: UIImage(named: "UIC")!))
        colleges.append(College(Name: "Stanford University", Location: "California", Students: 16136, Picture: UIImage(named: "Stanford University")!))
    }


    @IBAction func editButtonTapped(sender: UIBarButtonItem)
    {
        tableView.editing = !tableView.editing
    }
    
    
    @IBAction func addButtonTapped(sender: UIBarButtonItem)
    {
        let myAlert = UIAlertController(title: "Add College", message: nil, preferredStyle: .Alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
        myAlert.addAction(cancelAction)
        
        let addAction = UIAlertAction(title: "Add", style: .Default) { (addAction) -> Void in
            let myCollegeTextField = myAlert.textFields! [0] as UITextField
            let myLocationTextField = myAlert.textFields! [1] as UITextField
            self.colleges.append(College(Name: myCollegeTextField.text!, Location: myLocationTextField.text!))
            self.tableView.reloadData()
        }
        
            myAlert.addAction(addAction)
            myAlert.addTextFieldWithConfigurationHandler { (myCollegeTextField) -> Void in
                myCollegeTextField.placeholder = "Add College"
        }
            myAlert.addTextFieldWithConfigurationHandler { (myLocationTextField) -> Void in
                myLocationTextField.placeholder = "Add Location"
        }
            
            self.presentViewController(myAlert, animated: true, completion: nil)
    }
    
    
    
        func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
        {
            let tableViewCell = tableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath) as UITableViewCell
            tableViewCell.textLabel?.text = colleges[indexPath.row].name
            tableViewCell.detailTextLabel?.text = colleges[indexPath.row].location
            return tableViewCell
        }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return colleges.count
    }

        
        func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
        {
            if editingStyle == .Delete
            {
                colleges.removeAtIndex(indexPath.row)
                tableView.reloadData()
            }
        }

        func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool
        {
            return true
        }
        func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath)
        {
            let college = colleges[sourceIndexPath.row]
            colleges.removeAtIndex(sourceIndexPath.row)
            colleges.insert(college, atIndex: destinationIndexPath.row)
        }
        
        
        override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
        {
            let detailVC = segue.destinationViewController as! CollegeDetailViewController
            let selectRow = tableView.indexPathForSelectedRow?.row
            detailVC.colleges = colleges[selectRow!]
            
        }
    
    
    
}





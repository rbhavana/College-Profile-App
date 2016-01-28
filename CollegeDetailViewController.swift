//
//  CollegeDetailViewController.swift
//  College Profile Builder
//
//  Created by Student on 1/26/16.
//  Copyright © 2016 Student. All rights reserved.
//

import UIKit

class CollegeDetailViewController: UIViewController
{
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var myCollegeTextField: UITextField!
    @IBOutlet weak var myLocationTextField: UITextField!
    @IBOutlet weak var studentsTextField: UITextField!
    
    var colleges: College!

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        myCollegeTextField.text! = colleges.name
        myLocationTextField.text! = colleges.location
        studentsTextField.text! = String(colleges.numberOfStudents)
        myImageView.image = colleges.picture
    }
    
    @IBAction func saveButtonTapped(sender: UIButton)
    {
        colleges.name = myCollegeTextField.text!
        colleges.location = myLocationTextField.text!
        colleges.numberOfStudents = Int(studentsTextField.text!)!
    }
}

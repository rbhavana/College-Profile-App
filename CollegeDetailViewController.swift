//
//  CollegeDetailViewController.swift
//  College Profile Builder
//
//  Created by Student on 1/26/16.
//  Copyright © 2016 Student. All rights reserved.
//

import SafariServices

class CollegeDetailViewController: UIViewController, SFSafariViewControllerDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate
{
    @IBOutlet weak var myImageView: UIImageView!
    let imagePicker = UIImagePickerController()
    
    @IBOutlet weak var myCollegeTextField: UITextField!
    @IBOutlet weak var myLocationTextField: UITextField!
    @IBOutlet weak var studentsTextField: UITextField!
    @IBOutlet weak var websiteTextField: UITextField!
    
    var colleges: College!

    override func viewDidLoad()
    {
        super.viewDidLoad()
        imagePicker.delegate = self
        myCollegeTextField.text! = colleges.name
        myLocationTextField.text! = colleges.location
        studentsTextField.text! = String(colleges.numberOfStudents)
        myImageView.image = colleges.picture
        websiteTextField.text! = String(colleges.webpage)
    }
    
    @IBAction func saveButtonTapped(sender: UIButton)
    {
        colleges.name = myCollegeTextField.text!
        colleges.location = myLocationTextField.text!
        colleges.numberOfStudents = Int(studentsTextField.text!)!
        colleges.webpage = websiteTextField.text!
    }
    @IBAction func websiteButtonTapped(sender: UIButton)
    {
        let myURL = NSURL(string: "https://" + (colleges.webpage))
        let svc = SFSafariViewController(URL: myURL!)
        svc.delegate = self
        presentViewController(svc, animated: true, completion: nil)
    }
    
    func safariViewControllerDidFinish(controller: SFSafariViewController)
    {
        controller.dismissViewControllerAnimated(true, completion: nil)
    }
    @IBAction func imageButtonTapped(sender: UIButton)
    {
            imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
            presentViewController(imagePicker, animated: true, completion: nil)
        }
        
        func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject])
        {
            imagePicker.dismissViewControllerAnimated(true)
                { () -> Void in
                    let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
                    self.myImageView.image = selectedImage 
            }
    }
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        let CollegeMapVC = segue.destinationViewController as! CollegeMapViewController
        
        CollegeMapVC.colleges = colleges
        
        
    }
    
}
































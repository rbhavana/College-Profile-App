//
//  CollegeMapViewController.swift
//  College Profile Builder
//
//  Created by Student on 2/19/16.
//  Copyright © 2016 Student. All rights reserved.
//

import UIKit
import MapKit

class CollegeMapViewController: UIViewController
{
    
    var colleges: College!

    @IBOutlet weak var myMapView: MKMapView!
    @IBOutlet weak var myTextField: UITextField!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        myTextField.text = colleges.name
        geoCodeLocation(myTextField.text!)
    }

    @IBAction func searchButtonTapped(sender: UIButton)
    {
        geoCodeLocation(myTextField.text!)
        myTextField.resignFirstResponder()
    }
    
    func displayMap(MyPlaceMark: CLPlacemark)
    {
        let myLocation = MyPlaceMark
        let mySpan = MKCoordinateSpanMake(0.05, 0.05)
        let myRegion = MKCoordinateRegionMake((myLocation.location?.coordinate)!, mySpan)
        
        myMapView.setRegion(myRegion, animated: true)
        
        let myPin = MKPointAnnotation()
        myPin.coordinate = (myLocation.location?.coordinate)!
        myPin.title = MyPlaceMark.name
        
        myMapView.addAnnotation(myPin)
        myTextField.text = MyPlaceMark.name
    }
    
    func geoCodeLocation(mySearch: String)
    {
        let myGeoCode = CLGeocoder()
        
        myGeoCode.geocodeAddressString(mySearch) { (placemarks, error) -> Void in
            if error != nil
            {
                print("Error")
            }
                
            else if placemarks?.count > 1{
                let mySheet = UIAlertController(title: "Choose from...", message: nil, preferredStyle: UIAlertControllerStyle.ActionSheet)
                for each in placemarks!
                {
                    mySheet.addAction(UIAlertAction(title: each.name, style: .Default, handler: { (locationsAction) -> Void in
                        self.displayMap(((each)))
                }))
                }
            
            self.presentViewController(mySheet, animated: true, completion: nil)
            
        }
        
        else {
            self.displayMap((placemarks!.first)!)
        }
    }
}
}
























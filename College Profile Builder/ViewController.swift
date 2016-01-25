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
    var colleges = ["Harvard", "University Of Chicago", "Stanford University"]

    override func viewDidLoad()
    {
        super.viewDidLoad()
    }

}


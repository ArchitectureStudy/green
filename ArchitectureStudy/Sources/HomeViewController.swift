//
//  HomeViewController.swift
//  ArchitectureStudy
//
//  Created by Lee Junho on 2017. 1. 7..
//  Copyright © 2017년 Lee Junho. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    @IBAction func mvcButtonTapped(sender: UIButton) {
        performSegue(withIdentifier: "ShowMVC", sender: nil)
    }
}

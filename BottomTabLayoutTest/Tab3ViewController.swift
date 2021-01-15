//
//  Tab3ViewController.swift
//  BottomTabLayoutTest
//
//  Created by JaesungMoon on 2021/01/16.
//

import UIKit

class Tab3ViewController: UIViewController {
    
    @IBOutlet weak var navItem: UINavigationItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Tab3ViewController:viewDidLoad")
        view.backgroundColor = .yellow
        
        navItem.title = "TTT"
    }
    
}


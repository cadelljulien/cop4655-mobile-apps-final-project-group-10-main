//
//  ViewController.swift
//  Campus Parking Pal (CPP)
//
//  Created by YUMirinBrah on 11/7/23.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    @IBAction func test(_ sender: Any) {
        performSegue(withIdentifier: "ShowDetailSegue", sender: self)

    }
    
}


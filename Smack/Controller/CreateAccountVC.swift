//
//  CreateAccountVC.swift
//  Smack
//
//  Created by leslie on 8/17/19.
//  Copyright © 2019 leslie. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func closeBtn(_ sender: Any) {
        performSegue(withIdentifier: UNWIND_TO_CHANNEL, sender: nil)
    }
    
}

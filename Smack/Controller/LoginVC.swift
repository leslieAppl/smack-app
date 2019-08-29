//
//  LoginVC.swift
//  Smack
//
//  Created by leslie on 8/16/19.
//  Copyright © 2019 leslie. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    // Outlets
    @IBOutlet weak var userNametxt: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
    @IBAction func loginBtn(_ sender: Any) {
        spinner.isHidden = false
        spinner.startAnimating()
        
        guard let userName = userNametxt.text, userNametxt.text != "" else { return }
        guard let pass = password.text, password.text != "" else { return }
        
        AuthService.instance.loginUser(email: userName, password: pass) { (success) in
            if success {
                AuthService.instance.findUserByEmail(completion: { (success) in
                    if success {
                        NotificationCenter.default.post(name: NOTIFI_USER_DATA_DID_CHANGE, object: nil)
                        self.spinner.isHidden = true
                        self.spinner.stopAnimating()
                        self.dismiss(animated: true, completion: nil)
                    }
                })
            }
        }
    }
    
    @IBAction func closeBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func createAccountBtn(_ sender: Any) {
        performSegue(withIdentifier: TO_CREATE_ACCOUNT, sender: nil)
    }
    
    func setupView() {
        spinner.isHidden = true
        userNametxt.attributedPlaceholder = NSAttributedString(string: "email", attributes: [NSAttributedString.Key.foregroundColor: smackPurplePlaceholder])
        password.attributedPlaceholder = NSAttributedString(string: "password", attributes: [NSAttributedString.Key.foregroundColor: smackPurplePlaceholder])
        
    }
}

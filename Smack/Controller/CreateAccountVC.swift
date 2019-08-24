//
//  CreateAccountVC.swift
//  Smack
//
//  Created by leslie on 8/17/19.
//  Copyright © 2019 leslie. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {

    // Outlets
    @IBOutlet weak var userNameTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var userImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupView()
    }
    
    @IBAction func closeBtn(_ sender: Any) {
        performSegue(withIdentifier: UNWIND_TO_CHANNEL, sender: nil)
    }
    
    @IBAction func creatAccountBtn(_ sender: Any) {
        guard let email = emailTxt.text, emailTxt.text != "" else { return }
        guard let pass = passwordTxt.text, passwordTxt.text != "" else { return }
        
        AuthService.instance.registerUser(email: email, password: pass) { (success) in
            if success {
                AuthService.instance.loginUser(email: email, password: pass, comletion: { (success) in
                    if success {
                        print("user loged in!!", AuthService.instance.authToken)
                    }
                })
                
            }
        }
    }
    
    @IBAction func pickAvatarBtn(_ sender: Any) {
    }
    
    @IBAction func pickBGColorBtn(_ sender: Any) {
    }
    
    func setupView () {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
//    @objc func dismissKeyboard() {
//        view.endEditing(true)
//    }
}

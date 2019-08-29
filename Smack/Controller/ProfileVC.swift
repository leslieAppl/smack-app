//
//  ProfileVC.swift
//  Smack
//
//  Created by leslie on 8/29/19.
//  Copyright © 2019 leslie. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {
    
    // Outlets
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userEmail: UILabel!
    @IBOutlet weak var bgView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }

    @IBAction func closeBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    @IBAction func logoutBtn(_ sender: Any) {
        UserDataService.instance.logoutUser()
        NotificationCenter.default.post(name: NOTIFI_USER_DATA_DID_CHANGE, object: nil)
        dismiss(animated: true, completion: nil)
    }
    
    func setupView() {
        profileImg.image = UIImage(named: UserDataService.instance.avatarName)
        profileImg.backgroundColor = UserDataService.instance.returnUIColor(components: UserDataService.instance.avatarColor)
        userName.text = UserDataService.instance.name
        userEmail.text = UserDataService.instance.email
        
        let closeTouch = UITapGestureRecognizer(target: self, action: #selector(ProfileVC.closeTap))
        bgView.addGestureRecognizer(closeTouch)
    }
    
    @objc func closeTap() {
        dismiss(animated: true, completion: nil)
    }
}

//
//  MeViewController.swift
//  bbuddy
//
//  Created by Jackson Zhang on 06/02/2017.
//  Copyright © 2017 odd-e. All rights reserved.
//

import UIKit
import Cely
import FontAwesome

class MeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBarItem.image = UIImage.fontAwesomeIcon(name: .user, textColor: UIColor.black, size: CGSize(width: 30, height: 30))
    }

    @IBAction func signOut(_ sender: UIButton) {
        Cely.logout()
    }
    

}

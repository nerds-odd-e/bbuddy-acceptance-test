//
//  MainTabBarViewController.swift
//  bbuddy
//
//  Created by Jackson Zhang on 06/02/2017.
//  Copyright © 2017 odd-e. All rights reserved.
//

import UIKit
import FontAwesome

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tabBarIcons = [FontAwesome.tachometer, FontAwesome.book, FontAwesome.user]

        self.tabBar.items?.forEach {
            $0.image = UIImage.fontAwesomeIcon(name: tabBarIcons[$0.tag], textColor: UIColor.black, size: CGSize(width: 30, height: 30))
        }
    }

}

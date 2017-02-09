//
//  LoginStyles.swift
//  bbuddy
//
//  Created by Jackson Zhang on 07/02/2017.
//  Copyright © 2017 odd-e. All rights reserved.
//

import Foundation
import Cely
import FontAwesome

struct CottonCandy: CelyStyle {
    func appLogo() -> UIImage? {
        return UIImage.fontAwesomeIcon(name: .money, textColor: UIColor.green, size: CGSize(width: 300, height: 300))
    }
}

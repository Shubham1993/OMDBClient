//
//  UIColorExtension.swift
//  OMDB-Client
//
//  Created by Shubham Gupta on 27/10/18.
//  Copyright © 2018 OMDB. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    static func randomColor() -> UIColor {
        return UIColor(red:   .random(),
                       green: .random(),
                       blue:  .random(),
                       alpha: 1.0)
    }
}

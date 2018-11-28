//
//  CGFloatExtension.swift
//  OMDB-Client
//
//  Created by Shubham Gupta on 27/10/18.
//  Copyright © 2018 OMDB. All rights reserved.
//

import Foundation
import UIKit

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

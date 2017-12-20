//
//  UI+Identifiers.swift
//  baggage
//
//  Created by Nicolas Palmieri on 12/19/17.
//  Copyright © 2017 Nicolas Palmieri. All rights reserved.
//

import Foundation
import UIKit

/// Controller
extension UIViewController {

    class func identifier() -> String {
        let classString: String = NSStringFromClass(self)
        let index = classString.index(classString.startIndex, offsetBy: 18)
        return String(classString[index...])
    }
}

/// View
extension UIView {

    class func identifier() -> String? {
        let classString: String = NSStringFromClass(self)
        let index = classString.index(classString.startIndex, offsetBy: 18)
        return String(classString[index...])
    }
}

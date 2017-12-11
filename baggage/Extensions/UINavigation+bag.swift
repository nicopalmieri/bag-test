//
//  UINavigation+bag.swift
//  baggage
//
//  Created by Nicolas Palmieri on 12/11/17.
//  Copyright © 2017 Nicolas Palmieri. All rights reserved.
//

import Foundation
import UIKit

extension UINavigationController {

    /// The following methods are shortcuts for the general-behavior.
    func pop(animated: Bool) {
        // let's pop to the previous one
        _ = self.popViewController(animated: animated)
    }

    func popToRoot(animated: Bool) {
        // let's pop to the root of the stack
        _ = self.popToRootViewController(animated: animated)
    }

    func popTo(controller : UIViewController, animated: Bool) {
        // let's pop to a certain controller, animated or not
        _ = self.popToViewController(controller, animated: animated)
    }
}

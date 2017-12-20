//
//  LatamBaggageTrackingiOSApp.swift
//  baggage
//
//  Created by Nicolas Palmieri on 12/14/17.
//  Copyright © 2017 Nicolas Palmieri. All rights reserved.
//

import Foundation
import UIKit

protocol BaggageManagerProtocol: class {
    // here we describe the method-names
    func getControllerBy(identifier: String) -> UIViewController
}

/// iOSBundleSkeleton
public final class LatamBaggageTrackingiOSApp: NSObject, BaggageManagerProtocol {

    // here we implement 'em
    public func getControllerBy(identifier: String) -> UIViewController {
        let bundle = Bundle(for: LoginController.self)
        let storyboard = UIStoryboard(name: "Main", bundle: bundle)
        return storyboard.instantiateViewController(withIdentifier: identifier)
    }
}

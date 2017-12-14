//
//  Baggage.swift
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

public final class Baggage: NSObject, BaggageManagerProtocol {

    // here we implement 'em
    func getControllerBy(identifier: String) -> UIViewController {
        let bundle1 = Bundle(for: LoginController.self)
        let storyboard = UIStoryboard(name: "Main", bundle: bundle1)
        return storyboard.instantiateViewController(withIdentifier: identifier)
    }
}

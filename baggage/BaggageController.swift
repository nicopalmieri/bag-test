//
//  BaggageController.swift
//  baggage
//
//  Created by Nicolas Palmieri on 12/6/17.
//  Copyright © 2017 Nicolas Palmieri. All rights reserved.
//

import UIKit

public final class BaggageController: UIViewController {

    override public func viewDidLoad() {
        super.viewDidLoad()
        showThaView()
    }

    public func showThaView() {
        navigationItem.title = "Feliz navida'"
        print("success!")
    }
}


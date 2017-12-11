//
//  BaggageController.swift
//  baggage
//
//  Created by Nicolas Palmieri on 12/6/17.
//  Copyright © 2017 Nicolas Palmieri. All rights reserved.
//

import UIKit

class BaggageController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        showThaView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    public func showThaView() {
        self.navigationController?.title = "Hallo MDF!"
        print("success!")
    }
}


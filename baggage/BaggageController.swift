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
        setupView()
        showThaView()
    }

    @IBAction func buttonTapped(_ sender: Any) {
        print("WADDUP?!")
    }

    public func showThaView() {
        print("success!")
    }

    public func createView() -> BaggageController {
        return self
    }

    // MARK: - Private

    fileprivate func setupView() {
        self.title = "Just a title"
        self.view.backgroundColor = UIColor.lightGray
    }
}

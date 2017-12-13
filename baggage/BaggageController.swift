//
//  BaggageController.swift
//  baggage
//
//  Created by Nicolas Palmieri on 12/6/17.
//  Copyright © 2017 Nicolas Palmieri. All rights reserved.
//

import UIKit

public final class BaggageController: UIViewController {
    var controller = BaseController()

    override public func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        showThaView()
    }

    public func showThaView() {
        print("success!")
    }

    public func createView() -> BaseController {
        let bundle = Bundle(identifier: "com.latam.baggage")
        controller = BaseController(nibName: "BaseController", bundle: bundle)
        return controller
    }

    // MARK: - Private
    fileprivate func setupView() {
        title = "Just a title"
        view.backgroundColor = UIColor.lightGray
    }
}

//
//  LoginController.swift
//  baggage
//
//  Created by Nicolas Palmieri on 12/13/17.
//  Copyright © 2017 Nicolas Palmieri. All rights reserved.
//

import UIKit

public class LoginController: UIViewController {
    override public func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    // MARK: - Actions
    @IBAction func buttonTapped(_ sender: Any) {
        print("WADDUP?")
    }

    // MARK: - Private
    fileprivate func setupView() {
        title = "Base title goes here"
    }
}

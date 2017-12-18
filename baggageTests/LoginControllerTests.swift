//
//  LoginControllerTests.swift
//  baggageTests
//
//  Created by Nicolas Palmieri on 12/18/17.
//  Copyright © 2017 Nicolas Palmieri. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import baggage

class LoginControllerTests: QuickSpec {

    override func spec() {

        describe("viewDidLoad") {

            // if we have a controller with identifier
            context("after being initialized") {
                let identifier = "LoginController"
//                let bundle = Bundle(for: LoginController.self)
//                let storyboard = UIStoryboard(name: "Main", bundle: bundle)
//                let controller = storyboard.instantiateViewController(withIdentifier: identifier)

                it("shouldn't have an identifier") {
                    // expect(controller).toNot(beNil())
                }
            }
        }

        describe("buttonTapped") {
            // TUDO
        }

        describe("setupView") {
            // TUDO
        }
    }
}

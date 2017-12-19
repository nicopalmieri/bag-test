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

            var controller = LoginController()
            beforeEach {
                // anything needed as pre-setup
            }

            // if we have a controller with identifier
            context("after being initialized") {
                let identifier = "LoginController"
                let bundle = Bundle(for: LoginController.self)
                let storyboard = UIStoryboard(name: "Main", bundle: bundle)
                controller = storyboard.instantiateViewController(withIdentifier: identifier) as! LoginController

                it("shouldn't be nil") {
                    expect(controller).toNot(beNil())
                }

                it("should have an identifier") {
                    expect(LoginController.identifier()).to(equal("LoginController"))
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

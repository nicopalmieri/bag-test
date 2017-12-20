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
        var subject: LoginController!
        var controller = UIViewController()

        describe(".viewDidLoad") {
            beforeEach {
                subject = LoginController()
            }

            it("should load a view") {
                expect(subject.view).notTo(beNil())
            }

            // if we have a controller with identifier
            context("after being initialized") {
                let identifier = "LoginController"
                let bundle = Bundle(for: LoginController.self)
                let storyboard = UIStoryboard(name: "Main", bundle: bundle)
                controller = storyboard.instantiateViewController(withIdentifier: identifier)

                it("shouldn't be nil") {
                    expect(controller).toNot(beNil())
                }

                it("should have an identifier") {
                    expect(LoginController.identifier()).to(equal("LoginController"))
                }
            }
        }

        describe(".buttonTapped") {
            // TUDO
        }

        describe(".setupView") {
            subject = LoginController()

            beforeEach {
                // let's call the setupView function which is called on the load
                subject.viewDidLoad()
            }

            context("after being instantiated") {
                it("should have a title") {
                    expect(subject.title).to(equal("Base title goes here"))
                }
            }
        }
    }
}

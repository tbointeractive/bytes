//
//  UIApplicationExtensionsSpec.swift
//  bytes
//
//  Created by Thorsten Stark on 01.11.16.
//  Copyright © 2016 TBO INTERACTIVE GmbH & Co. KG. All rights reserved.
//

import bytes

import Quick
import Nimble

class UIApplicationExtensionsSpec: QuickSpec {
    override func spec() {
        describe("main") {
            it("should return an application with values from the main bundle") {
                let application = Application.main
                expect(application.displayName) == Bundle.main.infoDictionary?["CFBundleDisplayName"] as? String
                expect(application.name) == Bundle.main.infoDictionary?["CFBundleName"] as? String
                expect(application.version) == Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
                expect(application.buildVersion) == Bundle.main.infoDictionary?["CFBundleVersion"] as? String
            }
        }
        describe("semanticVersion") {
            it("should be nil if the version is nil") {
                let application = Application(name: nil, displayName: nil, buildVersion: nil, version: nil)
                expect(application.semanticVersion).to(beNil())
            }
            it("should be nil if the version has an invalid format") {
                let application = Application(name: nil, displayName: nil, buildVersion: nil, version: "this is not a valid version")
                expect(application.semanticVersion).to(beNil())
            }
            it("should be not nil if the version has a valid format") {
                let application = Application(name: nil, displayName: nil, buildVersion: nil, version: "1.2.3")
                expect(application.semanticVersion).toNot(beNil())
                expect(application.semanticVersion?.description) == "1.2.3"
            }
        }
    }
}

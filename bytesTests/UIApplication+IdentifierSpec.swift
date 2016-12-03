//
//  UIApplicationExtensionsSpec.swift
//  bytes
//
//  Created by Thorsten Stark on 01.11.16.
//  Copyright © 2016 TBO INTERACTIVE GmbH & Co. KG. All rights reserved.
//

@testable import bytes

import Quick
import Nimble

class UIApplicationExtensionsSpec: QuickSpec {
    override func spec() {
        describe("bundleDisplayName") {
            it("should match current bundle display name") {
                let displayName = UIApplication.bundleDisplayName
                expect(displayName).to(equal("TBO bytes"))
            }
        }
        describe("bundleName") {
            it("should match current bundle name") {
                let displayName = UIApplication.bundleName
                expect(displayName).to(equal("bytes"))
            }
        }
        describe("bundleVersion") {
            it("should match current bundle version") {
                let displayName = UIApplication.bundleVersion
                let compareName = Bundle.main.infoDictionary?["CFBundleVersion"] as? String
                expect(displayName).to(equal(compareName))
            }
        }
        describe("bundleShortVersion") {
            it("should match current bundle short version") {
                let displayName = UIApplication.bundleShortVersion
                let compareName = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
                expect(displayName).to(equal(compareName))
            }
        }
    }
}


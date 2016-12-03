//
//  UIDeviceExtensionsSpec.swift
//  bytes
//
//  Created by Thorsten Stark on 01.11.16.
//  Copyright © 2016 TBO INTERACTIVE GmbH & Co. KG. All rights reserved.
//

@testable import bytes

import Quick
import Nimble

class UIDeviceExtensionsSpec: QuickSpec {
    override func spec() {
        describe("platform") {
            it("should match simulator platform string") {
                let platform = UIDevice.platform
                expect(platform).to(equal("x86_64"))
            }
        }
        describe("humanReadablePlatformName") {
            it("should match human readable simulator platform string") {
                let platformName = UIDevice.humanReadablePlatformName
                expect(platformName).to(equal("Simulator"))
            }
        }
        describe("osVersion") {
            it("should match current os version") {
                let displayName = UIDevice.osVersion
                expect(displayName).to(equal(UIDevice.current.systemVersion))
            }
        }
    }
}

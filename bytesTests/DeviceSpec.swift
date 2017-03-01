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
        describe("current") {
            it("should return a Device with the current platform set") {
                let device = Device.current
                
                var size = 0
                sysctlbyname("hw.machine", nil, &size, nil, 0)
                var machine = [CChar](repeating: 0,  count: Int(size))
                sysctlbyname("hw.machine", &machine, &size, nil, 0)
                let platform = String(cString: machine)
                
                expect(device.platform) == platform
            }
            it("should return a Device with the current os version set") {
                let device = Device.current
                expect(device.osVersion) == UIDevice.current.systemVersion
            }
        }
        describe("humanReadablePlatform") {
            it("should return Simulator for a i386 platform") {
                let device = Device(platform: "i386", osVersion: "1.0")
                expect(device.humanReadablePlatform) == "Simulator"
            }
            it("should return nil for a unknown platform") {
                let device = Device(platform: "unknown", osVersion: "1.0")
                expect(device.humanReadablePlatform).to(beNil())
            }
        }
    }
}

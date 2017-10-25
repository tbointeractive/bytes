//
//  ByteCountFormatterExtensionSpec.swift
//  bytes
//
//  Created by Cornelius Horstmann on 16.11.16.
//  Copyright © 2016 TBO INTERACTIVE GmbH & Co. KG. All rights reserved.
//

@testable import bytes

import Quick
import Nimble

class ByteCountFormatterExtensionSpec: QuickSpec {
    override func spec() {
        describe("decimal") {
            it("should return a decimal ByteCountFormatter") {
                expect(ByteCountFormatter.decimal).toNot(beNil())
                expect(ByteCountFormatter.decimal.countStyle).to(equal(ByteCountFormatter.CountStyle.decimal))
            }
            it("should format bytes in a correct way") {
                let formatter = ByteCountFormatter.decimal
                expect(formatter.string(fromByteCount: 1)).to(equal("1 byte"))
                expect(formatter.string(fromByteCount: 1000)).to(equal("1 KB"))
                expect(formatter.string(fromByteCount: 1024)).to(equal("1 KB"))
                expect(formatter.string(fromByteCount: 1499)).to(equal("1 KB"))
                expect(formatter.string(fromByteCount: 1500)).to(equal("2 KB"))
                expect(formatter.string(fromByteCount: 10500)).to(equal("11 KB"))
                expect(formatter.string(fromByteCount: 1000*1000)).to(equal("1 MB"))
                expect(formatter.string(fromByteCount: 1000*1000*1000)).to(equal("1 GB"))
                expect(formatter.string(fromByteCount: 1000*1000*1000*1000)).to(equal("1 TB"))
            }
        }
        describe("binary") {
            it("should return a binary ByteCountFormatter") {
                expect(ByteCountFormatter.binary).toNot(beNil())
                expect(ByteCountFormatter.binary.countStyle).to(equal(ByteCountFormatter.CountStyle.binary))
            }
            it("should format bytes in a correct way") {
                let formatter = ByteCountFormatter.binary
                expect(formatter.string(fromByteCount: 1)).to(equal("1 byte"))
                expect(formatter.string(fromByteCount: 1000)).to(equal("1,000 bytes"))
                expect(formatter.string(fromByteCount: 1024)).to(equal("1 KB"))
                expect(formatter.string(fromByteCount: 1499)).to(equal("1 KB"))
                expect(formatter.string(fromByteCount: 1500)).to(equal("1 KB"))
                expect(formatter.string(fromByteCount: 1536)).to(equal("2 KB"))
                expect(formatter.string(fromByteCount: 10500)).to(equal("10 KB"))
                expect(formatter.string(fromByteCount: 1000*1000)).to(equal("977 KB"))
                expect(formatter.string(fromByteCount: 1000*1000*1000)).to(equal("953.7 MB"))
                expect(formatter.string(fromByteCount: 1000*1000*1000*1000)).to(equal("931.32 GB"))
                expect(formatter.string(fromByteCount: 1024*1024)).to(equal("1 MB"))
                expect(formatter.string(fromByteCount: 1024*1024*1024)).to(equal("1 GB"))
                expect(formatter.string(fromByteCount: 1024*1024*1024*1024)).to(equal("1 TB"))
            }
        }
    }
}

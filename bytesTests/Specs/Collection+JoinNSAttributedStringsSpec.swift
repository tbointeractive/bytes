//
//  Collection+JoinNSAttributedStringsSpec.swift
//  bytes
//
//  Created by Cornelius Horstmann on 25.08.17.
//  Copyright © 2017 TBO INTERACTIVE GmbH & Co. KG. All rights reserved.
//

import bytes

import Quick
import Nimble

class CollectionJoinNSAttributedStringsSpec: QuickSpec {
    override func spec() {
        describe("joined") {
            it("should join without a separator") {
                let strings = [NSAttributedString(string: "foo"), NSAttributedString(string: "bar")]
                expect(strings.joined()) == NSAttributedString(string: "foobar")
            }
            it("should work with just one element") {
                let strings = [NSAttributedString(string: "foo")]
                expect(strings.joined()) == NSAttributedString(string: "foo")
            }
            it("should work with no element") {
                let strings: [NSAttributedString] = []
                expect(strings.joined()) == NSAttributedString(string: "")
            }
            it("should work with more than two elements") {
                let strings = [NSAttributedString(string: "foo"), NSAttributedString(string: "bar"), NSAttributedString(string: "baz")]
                expect(strings.joined()) == NSAttributedString(string: "foobarbaz")
            }
            it("should insert the separator") {
                let strings = [NSAttributedString(string: "foo"), NSAttributedString(string: "bar"), NSAttributedString(string: "baz")]
                expect(strings.joined(separator: NSAttributedString(string: "-"))) == NSAttributedString(string: "foo-bar-baz")
            }
            it("should insert the separator with just one element") {
                let strings = [NSAttributedString(string: "foo")]
                expect(strings.joined(separator: NSAttributedString(string: "-"))) == NSAttributedString(string: "foo")
            }
            it("should insert the separator with no element") {
                let strings: [NSAttributedString] = []
                expect(strings.joined(separator: NSAttributedString(string: "-"))) == NSAttributedString(string: "")
            }
            it("should copy over the attributes") {
                let first = NSAttributedString(string: "foo", attributes:[NSAttributedString.Key.foregroundColor: UIColor.red])
                let second = NSAttributedString(string: "bar", attributes:[NSAttributedString.Key.foregroundColor: UIColor.green])
                let expected = NSMutableAttributedString(string: "foobar")
                expected.setAttributes([NSAttributedString.Key.foregroundColor: UIColor.red], range: NSRange(location: 0, length: 3))
                expected.setAttributes([NSAttributedString.Key.foregroundColor: UIColor.green], range: NSRange(location: 3, length: 3))
                expect([first, second].joined()) == expected
            }
        }
    }
}

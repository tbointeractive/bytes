//
//  URLExtensionSpec.swift
//  bytes
//
//  Created by Cornelius Horstmann on 20.11.16.
//  Copyright © 2016 TBO INTERACTIVE GmbH & Co. KG. All rights reserved.
//

@testable import bytes

import Quick
import Nimble

class URLExtensionSpec: QuickSpec {
    override func spec() {
        describe("adding") {
            it("should add query parameters") {
                let url = URL(string: "http://tbointeractive.com")!
                let added = url.adding(query: ["a": "b"])
                expect(added?.absoluteString).to(equal("http://tbointeractive.com?a=b"))
            }
            it("should encode keys and values") {
                let url = URL(string: "http://tbointeractive.com")!
                let added = url.adding(query: ["a a": "b b"])
                expect(added?.absoluteString).to(equal("http://tbointeractive.com?a%20a=b%20b"))
            }
            context("to a url that has parameters") {
                let url = URL(string: "http://tbointeractive.com?a=b&c=c")!
                it("should add query parameters to a url that already has some") {
                    let added = url.adding(query: ["e": "g"])
                    expect(added?.absoluteString).to(equal("http://tbointeractive.com?a=b&c=c&e=g"))
                }
                it("should override existing parameters") {
                    let added = url.adding(query: ["c": "d"])
                    expect(added?.absoluteString).to(equal("http://tbointeractive.com?a=b&c=d"))
                }
            }
        }
        describe("setting") {
            it("should set query parameters") {
                let url = URL(string: "http://tbointeractive.com")!
                let added = url.setting(query: ["a": "b"])
                expect(added?.absoluteString).to(equal("http://tbointeractive.com?a=b"))
            }
            it("should replace existing query parameters") {
                let url = URL(string: "http://tbointeractive.com?a=b")!
                let added = url.setting(query: ["c": "d"])
                expect(added?.absoluteString).to(equal("http://tbointeractive.com?c=d"))
            }
        }
        describe("queryItems") {
            it("should return an array of queryItems") {
                let url = URL(string: "http://tbointeractive.com?a=b&c=d")!
                expect(url.queryItems().count).to(equal(2))
                expect(url.queryItems().first!.name).to(equal("a"))
                expect(url.queryItems().first!.value).to(equal("b"))
            }
            it("should unencode the parameters") {
                let url = URL(string: "http://tbointeractive.com?a%20a=b%20b")!
                expect(url.queryItems().count).to(equal(1))
                expect(url.queryItems().first!.name).to(equal("a a"))
                expect(url.queryItems().first!.value).to(equal("b b"))
            }
            context("with a url that has no parameters") {
                it("should return an empty array") {
                    let url = URL(string: "http://tbointeractive.com")!
                    expect(url.queryItems().count).to(equal(0))
                }
            }
        }
    }
}

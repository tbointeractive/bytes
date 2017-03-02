//
//  String+HashesSpec.swift
//  bytes
//
//  Created by Pascal Stüdlein on 01/03/2017.
//  Copyright © 2017 TBO INTERACTIVE GmbH & Co. KG. All rights reserved.
//

@testable import bytes

import Quick
import Nimble

class StringHashesSpec: QuickSpec {
    override func spec() {
        describe("md5Hash") {
            it ("should hash the value of 'tbointeractive' correctly with md5") {
                expect("tbointeractive".md5) == "ce4e63a8973664258a13b5bcba270bc9"
            }
        }

        describe("sha1") {
            it ("should hash the value of 'tbointeractive' correctly with sha1") {
                expect("tbointeractive".sha1) == "d5b5696aceca834b13e07bd38ad67aa6140e05c7"
            }
        }

        describe("sha224") {
            it ("should hash the value of 'tbointeractive' correctly with sha224") {
                expect("tbointeractive".sha224) == "bcc1075e580cb2a4aec1c7b925b83182645c7b107d1f4796fafd12b1"
            }
        }

        describe("sha256") {
            it ("should hash the value of 'tbointeractive' correctly with sha256") {
                expect("tbointeractive".sha256) == "85e87f3d607282413cd9f083fd5f0ba0407a0bdee171276197bc12555aa1f5ca"
            }
        }

        describe("sha384") {
            it ("should hash the value of 'tbointeractive' correctly with sha384") {
                expect("tbointeractive".sha384) == "0ebe15e8f357997de06b83a6223bfc67903f6d1897bc2fa8036625a110a720b9d9a78b9893e1bf36dc01bdd33e39d613"
            }
        }

        describe("sha512") {
            it ("should hash the value of 'tbointeractive' correctly with sha512") {
                expect("tbointeractive".sha512) == "8043f0a806418696b9040f7d6458948d7f428c4b203665b7817baa12c19b75af58587ddfcd5ebb2636126b9f2e9190ac4eeda203ff4ea1fbb6e4fde5da8f79cf"
            }
        }
    }
}

//
//  SemanticVersionSpec.swift
//  bytes
//
//  Created by Cornelius Horstmann on 11.12.16.
//  Copyright © 2016 TBO INTERACTIVE GmbH & Co. KG. All rights reserved.
//

import bytes

import Quick
import Nimble

class SemanticVersionSpec: QuickSpec {
    override func spec() {
        describe("init") {
            it("should store all properties") {
                let version = SemanticVersion(major: 1, minor: 2, patch: 3, prereleaseIdentifiers: ["4","b"])
                expect(version.major) == 1
                expect(version.minor) == 2
                expect(version.patch) == 3
                expect(version.prereleaseIdentifiers) == ["4","b"]
            }
        }
        describe("initWithString") {
            it("should parse a full version string") {
                let version = SemanticVersion("1.2.3")
                expect(version!.major) == 1
                expect(version!.minor) == 2
                expect(version!.patch) == 3
                expect(version!.prereleaseIdentifiers) == []
            }
            it("should parse a version string with leading or trailing whitespaces") {
                let version = SemanticVersion(" 1.2.3 ")
                expect(version).toNot(beNil())
                expect(version!.major) == 1
                expect(version!.minor) == 2
                expect(version!.patch) == 3
                expect(version!.prereleaseIdentifiers) == []
            }
            it("should parse just a major version string") {
                let version = SemanticVersion("1")!
                expect(version.major) == 1
                expect(version.minor) == 0
                expect(version.patch) == 0
                expect(version.prereleaseIdentifiers) == []
            }
            it("should parse just a major and minor version string") {
                let version = SemanticVersion("1.2")!
                expect(version.major) == 1
                expect(version.minor) == 2
                expect(version.patch) == 0
                expect(version.prereleaseIdentifiers) == []
            }
            it("should parse a version string with prerelease labels") {
                let version = SemanticVersion("1.2.3-beta.1")
                expect(version!.major) == 1
                expect(version!.minor) == 2
                expect(version!.patch) == 3
                expect(version!.prereleaseIdentifiers) == ["beta","1"]
            }
            it("should return nil for an invalid string") {
                let version = SemanticVersion("a")
                expect(version).to(beNil())
            }
        }
        describe("description") {
            it("should return a describing string") {
                let version = SemanticVersion("1.2.3")
                expect(version?.description) == "1.2.3"
                expect("\(version!)") == "1.2.3"
            }
            it("should work with prerelease information") {
                let version = SemanticVersion("1.2.3-beta.1")
                expect(version?.description) == "1.2.3-beta.1"
            }
        }
        describe("equals") {
            it("should be euqal if the objects are equal") {
                let a = SemanticVersion(major: 1, minor: 2, patch: 3, prereleaseIdentifiers: ["alpha"])
                let b = SemanticVersion(major: 1, minor: 2, patch: 3, prereleaseIdentifiers: ["alpha"])
                expect(a==b).to(beTrue())
            }
            it("should not be true if the prerelease labels are different") {
                let a = SemanticVersion(major: 1, minor: 2, patch: 3, prereleaseIdentifiers: ["alpha"])
                let b = SemanticVersion(major: 1, minor: 2, patch: 3, prereleaseIdentifiers: ["beta"])
                expect(a==b).to(beFalse())
            }
            it("should not be true if the version integers arent the same") {
                let a = SemanticVersion(major: 1, minor: 2, patch: 3, prereleaseIdentifiers: ["alpha"])
                let b = SemanticVersion(major: 1, minor: 2, patch: 4, prereleaseIdentifiers: ["alpha"])
                expect(a==b).to(beFalse())
            }
        }
        describe("smaller than") {
            it("should return true if the major version is smaller") {
                let version = SemanticVersion(major: 2, minor: 3, patch: 4, prereleaseIdentifiers: ["alpha", "beta","20"])
                expect(version < SemanticVersion(major: 3, minor: 2, patch: 3)) == true
            }
            it("should return false if the major version is greater") {
                let version = SemanticVersion(major: 2, minor: 3, patch: 4, prereleaseIdentifiers: ["alpha", "beta","20"])
                expect(SemanticVersion(major: 3, minor: 2, patch: 3) < version) == false
            }
            it("should return true if the major is the same but the minor is smaller") {
                let version = SemanticVersion(major: 2, minor: 3, patch: 4, prereleaseIdentifiers: ["alpha", "beta","20"])
                expect(version < SemanticVersion(major: 2, minor: 4, patch: 5)) == true
            }
            it("should return false if the major is the same but the minor is greater") {
                let version = SemanticVersion(major: 2, minor: 3, patch: 4, prereleaseIdentifiers: ["alpha", "beta","20"])
                expect(SemanticVersion(major: 2, minor: 4, patch: 5) < version) == false
            }
            it("should return true if major and minor are equal but the patch is smaller") {
                let version = SemanticVersion(major: 2, minor: 3, patch: 4, prereleaseIdentifiers: ["alpha", "beta","20"])
                expect(version < SemanticVersion(major: 2, minor: 3, patch: 5)) == true
            }
            it("should return false if major and minor are equal but the patch is greater") {
                let version = SemanticVersion(major: 2, minor: 3, patch: 4, prereleaseIdentifiers: ["alpha", "beta","20"])
                expect(SemanticVersion(major: 2, minor: 3, patch: 5) < version) == false
            }
            context("with equal major, minor and patch version"){
                it("should return false if only the other version has prerelease labels") {
                    let version = SemanticVersion(major: 2, minor: 3, patch: 4)
                    expect(version < SemanticVersion(major: 2, minor: 3, patch: 4, prereleaseIdentifiers: ["a"])) == false
                    expect(SemanticVersion(major: 2, minor: 3, patch: 4, prereleaseIdentifiers: ["a"]) < version) == true
                }
                it("should return true if the first prerelease label is a smaller number") {
                    let version = SemanticVersion(major: 2, minor: 3, patch: 4, prereleaseIdentifiers: ["1"])
                    expect(version < SemanticVersion(major: 2, minor: 3, patch: 4, prereleaseIdentifiers: ["2"])) == true
                    expect(SemanticVersion(major: 2, minor: 3, patch: 4, prereleaseIdentifiers: ["2"]) < version) == false
                }
                it("should return true if the first prerelease label is a smaller string") {
                    let version = SemanticVersion(major: 2, minor: 3, patch: 4, prereleaseIdentifiers: ["aa"])
                    expect(version < SemanticVersion(major: 2, minor: 3, patch: 4, prereleaseIdentifiers: ["ab"])) == true
                    expect(version < SemanticVersion(major: 2, minor: 3, patch: 4, prereleaseIdentifiers: ["aab"])) == true
                    expect(version < SemanticVersion(major: 2, minor: 3, patch: 4, prereleaseIdentifiers: ["b"])) == true
                    expect(SemanticVersion(major: 2, minor: 3, patch: 4, prereleaseIdentifiers: ["b"]) < version) == false
                }
                it("should return true if the first label is a number while the other version has a string") {
                    let version = SemanticVersion(major: 2, minor: 3, patch: 4, prereleaseIdentifiers: ["1"])
                    expect(version < SemanticVersion(major: 2, minor: 3, patch: 4, prereleaseIdentifiers: ["a"])) == true
                    expect(SemanticVersion(major: 2, minor: 3, patch: 4, prereleaseIdentifiers: ["a"]) < version) == false
                }
                it("should return true if the first label is the same while the other version has more preresease labels") {
                    let version = SemanticVersion(major: 2, minor: 3, patch: 4, prereleaseIdentifiers: ["a"])
                    expect(version < SemanticVersion(major: 2, minor: 3, patch: 4, prereleaseIdentifiers: ["a","b"])) == true
                    expect(SemanticVersion(major: 2, minor: 3, patch: 4, prereleaseIdentifiers: ["a","b"]) < version) == false
                }
            }
            it("should return true if major, minor and patch are equal, but it has prerelease labels") {
                let version = SemanticVersion(major: 2, minor: 3, patch: 4, prereleaseIdentifiers: ["a"])
                expect(version < SemanticVersion(major: 2, minor: 3, patch: 4)) == true
                expect(SemanticVersion(major: 2, minor: 3, patch: 4) < version) == false
            }
            it("should return true if major, minor and patch are equal, bit is has less prerelease labels than the other") {
                let version = SemanticVersion(major: 2, minor: 3, patch: 4, prereleaseIdentifiers: ["b"])
                expect(version < SemanticVersion(major: 2, minor: 3, patch: 4, prereleaseIdentifiers: ["b","c"])) == true
                expect(SemanticVersion(major: 2, minor: 3, patch: 4, prereleaseIdentifiers: ["b","c"]) < version) == false
                expect(version < SemanticVersion(major: 2, minor: 3, patch: 4, prereleaseIdentifiers: ["a","c"])) == false
                expect(SemanticVersion(major: 2, minor: 3, patch: 4, prereleaseIdentifiers: ["a","c"]) < version) == true
            }
            it("should return false if both versions are equal") {
                expect(SemanticVersion(major: 2, minor: 3, patch: 4) < SemanticVersion(major: 2, minor: 3, patch: 4)) == false
            }
            it("should respect the testcases on the semver.org page") {
                expect(SemanticVersion("1.0.0")! < SemanticVersion("2.0.0")!) == true
                expect(SemanticVersion("2.0.0")! < SemanticVersion("2.1.0")!) == true
                expect(SemanticVersion("2.1.0")! < SemanticVersion("2.1.2")!) == true
                
                expect(SemanticVersion("1.0.0-alpha")! < SemanticVersion("1.0.0")!) == true
                
                expect(SemanticVersion("1.0.0-alpha")! < SemanticVersion("1.0.0-alpha.1")!) == true
                expect(SemanticVersion("1.0.0-alpha.1")! < SemanticVersion("1.0.0-alpha.beta")!) == true
                expect(SemanticVersion("1.0.0-alpha.beta")! < SemanticVersion("1.0.0-beta")!) == true
                expect(SemanticVersion("1.0.0-beta")! < SemanticVersion("1.0.0-beta.2")!) == true
                expect(SemanticVersion("1.0.0-beta.2")! < SemanticVersion("1.0.0-beta.11")!) == true
                expect(SemanticVersion("1.0.0-beta.11")! < SemanticVersion("1.0.0-rc.1")!) == true
                expect(SemanticVersion("1.0.0-rc.1")! < SemanticVersion("1.0.0")!) == true
            }
        }
        describe("greater than") {
            // scince greater and smaller are implemented the same way
            // and actually greater than actually calls smaller than with
            // swiched attributes we just use a very short test here
            it("return the oposite of smaller than") {
                expect(SemanticVersion("1.0.0")! > SemanticVersion("2.0.0")!) == false
                expect(SemanticVersion("2.0.0")! > SemanticVersion("1.0.0")!) == true
            }
        }
    }
}

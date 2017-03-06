//
//  String+Hashes.swift
//  bytes
//
//  Created by Pascal Stüdlein on 01/03/2017.
//  Copyright © 2017 TBO INTERACTIVE GmbH & Co. KG. All rights reserved.
//

import Foundation
import CCommonCrypto

typealias CCHashSignature = (_ data: UnsafeRawPointer, _ len: CC_LONG, _ md: UnsafeMutablePointer<UInt8>) -> UnsafeMutablePointer<UInt8>!

extension String {

    
    /// CCHashFunction uses the CommonCrypto library to create a hash of the String.
    ///
    /// - Parameters:
    ///   - function: A hash function that should be used. E.g. CC_MD5, CC_SHA1
    ///   - digestLength: digestLength of the specific hash function. E.g. CC_MD5_DIGEST_LENGTH
    /// - Returns: A String representing the generated hash
    private func CCHashFunction(function:CCHashSignature , digestLength: Int32) -> String {
        let str = self.cString(using: String.Encoding.utf8)
        let strLen = CC_LONG(self.lengthOfBytes(using: String.Encoding.utf8))
        let digestLen = Int(digestLength)
        let result = UnsafeMutablePointer<CUnsignedChar>.allocate(capacity: digestLen)
        
        _ = function(str!, strLen, result)
        
        let hash = NSMutableString()
        for i in 0..<digestLen {
            hash.appendFormat("%02x", result[i])
        }
        
        result.deallocate(capacity: digestLen)
        
        return String(format: hash as String)
    }

    /// Creates a String with a sequence of 32 hexadecimal digits as md5 hash representation.
    /// The md5 String of 'tbointeractive' is 'ce4e63a8973664258a13b5bcba270bc9'.
    ///
    /// - Returns: md5 hash as an instance of String
    public var md5: String! {
        return CCHashFunction(function: CC_MD5, digestLength: CC_MD5_DIGEST_LENGTH)
    }

    /// Creates a String with a sequence of 40 hexadecimal digits as sha1 hash representation.
    /// The sha1 String of 'tbointeractive' is 'd5b5696aceca834b13e07bd38ad67aa6140e05c7'.
    ///
    /// - Returns: sha1 hash as an instance of String
    public var sha1: String {
        return CCHashFunction(function: CC_SHA1, digestLength: CC_SHA1_DIGEST_LENGTH)
    }

    /// Creates a String with a sequence of 56 hexadecimal digits as sha224 hash representation.
    /// The sha224 String of 'tbointeractive' is 'bcc1075e580cb2a4aec1c7b925b83182645c7b107d1f4796fafd12b1'.
    ///
    /// - Returns: sha224 hash as an instance of String
    public var sha224: String {
        return CCHashFunction(function: CC_SHA224, digestLength: CC_SHA224_DIGEST_LENGTH)
    }
   
    /// Creates a String with a sequence of 64 hexadecimal digits as sha256 hash representation.
    /// The sha256 String of 'tbointeractive' is '85e87f3d607282413cd9f083fd5f0ba0407a0bdee171276197bc12555aa1f5ca'.
    ///
    /// - Returns: sha256 hash as an instance of String
    public var sha256: String {
        return CCHashFunction(function: CC_SHA256, digestLength: CC_SHA256_DIGEST_LENGTH)
    }
   
    /// Creates a String with a sequence of 96 hexadecimal digits as sha384 hash representation.
    /// The sha384 String of 'tbointeractive' is '0ebe15e8f357997de06b83a6223bfc67903f6d1897bc2fa8036625a110a720b9d9a78b9893e1bf36dc01bdd33e39d613'.
    ///
    /// - Returns: sha384 hash as an instance of String
    public var sha384: String {
        return CCHashFunction(function: CC_SHA384, digestLength: CC_SHA384_DIGEST_LENGTH)
    }

    /// Creates a String with a sequence of 128 hexadecimal digits as sha512 hash representation.
    /// The sha512 String of 'tbointeractive' is '8043f0a806418696b9040f7d6458948d7f428c4b203665b7817baa12c19b75af58587ddfcd5ebb2636126b9f2e9190ac4eeda203ff4ea1fbb6e4fde5da8f79cf'.
    ///
    /// - Returns: sha512 hash as an instance of String
    public var sha512: String {
        return CCHashFunction(function: CC_SHA512, digestLength: CC_SHA512_DIGEST_LENGTH)
    }
}

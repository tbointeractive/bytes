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

    public var md5: String! {
        return CCHashFunction(function: CC_MD5, digestLength: CC_MD5_DIGEST_LENGTH)
    }

    public var sha1: String {
        return CCHashFunction(function: CC_SHA1, digestLength: CC_SHA1_DIGEST_LENGTH)
    }

    public var sha224: String {
        return CCHashFunction(function: CC_SHA224, digestLength: CC_SHA224_DIGEST_LENGTH)
    }

    public var sha256: String {
        return CCHashFunction(function: CC_SHA256, digestLength: CC_SHA256_DIGEST_LENGTH)
    }

    public var sha384: String {
        return CCHashFunction(function: CC_SHA384, digestLength: CC_SHA384_DIGEST_LENGTH)
    }

    public var sha512: String {
        return CCHashFunction(function: CC_SHA512, digestLength: CC_SHA512_DIGEST_LENGTH)
    }
}

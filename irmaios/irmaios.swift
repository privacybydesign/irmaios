//
//  irmaios.swift
//  irmaios
//
//  Created by David on 2/12/19.
//  Copyright © 2019 privacybydesign foundation. All rights reserved.
//

import Foundation

public func StartIRMA(sessionPointer: String, returnURL: String) -> Bool {
    guard let jsonPointer = try? JSONSerialization.jsonObject(with: sessionPointer.data(using: .utf8)!) else {
        return false
    }
    
    guard var dictPointer = jsonPointer as? [String: Any] else {
        return false
    }
    
    dictPointer["returnURL"] = returnURL
    
    guard let sessionData = try? JSONSerialization.data(withJSONObject: dictPointer) else {
        return false
    }
    
    guard let sessionString = String(data:sessionData, encoding: .utf8) else {
        return false
    }
    
    var irmaURLBuilder = URLComponents()
    irmaURLBuilder.scheme = "https"
    irmaURLBuilder.host = "irma.app"
    irmaURLBuilder.path = "/-/session"
    irmaURLBuilder.fragment = sessionString
    
    guard let url = irmaURLBuilder.url else {
        return false
    }
    
    UIApplication.shared.open(url, options: [:], completionHandler: nil)
    return true
}

//
//  URLUtil.swift
//  URLBuilder
//
//  Created by Eduardo Sanches Bocato on 22/04/19.
//  Copyright © 2019 Eduardo Sanches Bocato. All rights reserved.
//

import Foundation

class URLUtil {
    
    /// Provides a simple way to get scaped query parameters
    ///
    /// - Parameter parameters: the parameters for the query
    /// - Returns: an string representing the parameters
    func escapedParameters(_ parameters: [String: Any]) -> String {
        if parameters.isEmpty {
            return ""
        } else {
            var keyValuePairs = [String]()
            for (key, value) in parameters {
                // make sure that it is a string value
                let stringValue = "\(value)"
                // escape it
                let escapedValue = stringValue.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                // append it
                keyValuePairs.append(key + "=" + "\(escapedValue!)")
            }
            return "?\(keyValuePairs.joined(separator: "&"))"
        }
    }
    
}

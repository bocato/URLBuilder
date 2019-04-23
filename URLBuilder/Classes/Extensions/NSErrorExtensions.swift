//
//  NSErrorExtensions.swift
//  URLBuilder
//
//  Created by Eduardo Sanches Bocato on 23/04/19.
//  Copyright © 2019 Eduardo Sanches Bocato. All rights reserved.
//

import Foundation

extension NSError {
    
    convenience init(domain: String, code: Int, description: String) {
        self.init(domain: domain, code: code, userInfo: [(kCFErrorLocalizedDescriptionKey as CFString) as String: description])
    }
    
}

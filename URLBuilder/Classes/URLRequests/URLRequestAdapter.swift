//
//  URLRequestAdapter.swift
//  URLBuilder
//
//  Created by Eduardo Sanches Bocato on 23/04/19.
//  Copyright © 2019 Eduardo Sanches Bocato. All rights reserved.
//

import Foundation

public protocol URLRequestAdapter {
    /// Inspects and adapts the specified `URLRequest` in some manner if necessary and returns the result.
    ///
    /// - parameter urlRequest: The URL request to adapt.
    ///
    /// - throws: An `Error` if the adaptation encounters an error.
    ///
    /// - returns: The adapted `URLRequest`.
    func adapt(_ urlRequest: URLRequest) throws -> URLRequest
}

//
//  APIService.swift
//  URLBuilder
//
//  Created by Eduardo Sanches Bocato on 23/04/19.
//  Copyright © 2019 Eduardo Sanches Bocato. All rights reserved.
//

import Foundation

/// Defines an API service
public protocol APIService {
    
    /// The dispatcher to take care of the network requests
    var dispatcher: URLRequestDispatcherProtocol { get }
    
    /// Intializer to inject the dispatcher
    ///
    /// - Parameter dispatcher: the dispatcher to take care of the network requests
    init(dispatcher: URLRequestDispatcherProtocol)
}

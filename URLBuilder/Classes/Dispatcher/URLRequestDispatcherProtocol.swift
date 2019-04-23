//
//  URLRequestDispatcherProtocol.swift
//  URLBuilder
//
//  Created by Eduardo Sanches Bocato on 23/04/19.
//  Copyright © 2019 Eduardo Sanches Bocato. All rights reserved.
//

import Foundation

/// This guy is responsible for executing the requests
/// by calling whoever we want to use as a client to deal
/// with networking...
public protocol URLRequestDispatcherProtocol {
    
    /// Executes the request and provides a completion with the response
    ///
    /// - Parameters:
    ///   - request: the request to be executed
    ///   - completion: the requests callback
    /// - Returns: a token in order to let us manipulate the task if needed
    func execute(request: URLRequestProtocol, completion: @escaping (_ response: Result<Data?, URLRequestError>) -> Void) -> URLRequestToken?
}

//
//  URLRequestToken.swift
//  URLBuilder
//
//  Created by Eduardo Sanches Bocato on 23/04/19.
//  Copyright © 2019 Eduardo Sanches Bocato. All rights reserved.
//

import Foundation

/// Task abstraction in order to make the request cancelable without exposing the URLSessionDataTask
public class URLRequestToken {
    
    // MARK: Properties
    
    private weak var task: URLSessionDataTask?
    
    // MARK: - Initialization
    
    /// Initiliser
    ///
    /// - Parameter task: and URLSessionDataTask that could be canceled
    public init(task: URLSessionDataTask) {
        self.task = task
    }
    
    // MARK: - Functions
    
    /// Cancels the data task
    public func cancel() {
        task?.cancel()
    }
    
}

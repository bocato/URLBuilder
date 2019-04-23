//
//  URLRequestBuilder.swift
//  URLBuilder
//
//  Created by Eduardo Sanches Bocato on 22/04/19.
//  Copyright © 2019 Eduardo Sanches Bocato. All rights reserved.
//

import Foundation



public class URLRequestBuilder {
    
    // MARK: - Properties
    
    private var baseURL: URL
    private var path: String
    private var method: HTTPMethod = .get
    private var headers: [String: Any]?
    private var parameters: URLRequestParameters?
    private var adapters: [URLRequestAdapter] = []
    
    // MARK: - Initialization
    
    /// <#Description#>
    ///
    /// - Parameters:
    ///   - baseURL: <#baseURL description#>
    ///   - path: <#path description#>
    public init(with baseURL: URL, path: String) {
        self.baseURL = baseURL
        self.path = path
    }
    
    // MARK: - Builder methods
    
    /// <#Description#>
    ///
    /// - Parameter method: <#method description#>
    /// - Returns: <#return value description#>
    @discardableResult
    public func set(method: HTTPMethod) -> Self {
        self.method = method
        return self
    }
    
    /// <#Description#>
    ///
    /// - Parameter path: <#path description#>
    /// - Returns: <#return value description#>
    @discardableResult
    public func set(path: String) -> Self {
        self.path = path
        return self
    }
    
    /// <#Description#>
    ///
    /// - Parameter headers: <#headers description#>
    /// - Returns: <#return value description#>
    @discardableResult
    public func set(headers: [String: Any]?) -> Self {
        self.headers = headers
        return self
    }
    
    /// <#Description#>
    ///
    /// - Parameter parameters: <#parameters description#>
    /// - Returns: <#return value description#>
    @discardableResult
    public func set(parameters: URLRequestParameters?) -> Self {
        self.parameters = parameters
        return self
    }
    
    /// <#Description#>
    ///
    /// - Parameter adapter: <#adapter description#>
    /// - Returns: <#return value description#>
    @discardableResult
    public func add(adapter: URLRequestAdapter?) -> Self {
        guard let adapter = adapter else { return self }
        adapters.append(adapter)
        return self
    }
    
    /// <#Description#>
    ///
    /// - Returns: <#return value description#>
    public func build() throws -> URLRequest {
        
        let url = baseURL.appendingPathComponent(path)
        var urlRequest = URLRequest(url: url,
                                    cachePolicy: .reloadIgnoringLocalAndRemoteCacheData,
                                    timeoutInterval: 100)
        
        urlRequest.httpMethod = method.name
        setupRequest(&urlRequest, with: parameters)
        
        headers?
            .compactMapValues { $0 as? String }
            .forEach {
                urlRequest.addValue($0.value, forHTTPHeaderField: $0.key)
        }
        
        do {
            
            try adapters.forEach {
                urlRequest = try $0.adapt(urlRequest)
            }
            
        } catch {
            throw error
        }
        
        return urlRequest
    }
    
    // MARK: - Private Functions
    
    private func setupRequest(_ request: inout URLRequest, with parameters: URLRequestParameters?) {
        
        guard let parameters = parameters else { return }
        
        switch parameters {
        case .body(let bodyParameters):
            guard let bodyParameters = bodyParameters,
                let payload = try? JSONSerialization.data(withJSONObject: bodyParameters, options: []) else { return }
            request.httpBody = payload
        case .url(let urlParameters):
            guard let urlParameters = urlParameters else { return }
            let queryParameters = URLUtil().escapedParameters(urlParameters)
            request.url?.appendPathComponent(queryParameters)
        }
        
    }
    
}

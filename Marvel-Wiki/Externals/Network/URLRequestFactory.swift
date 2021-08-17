//
//  URLRequestFactory.swift
//  Marvel-Wiki
//
//  Created by Ramzy on 15/08/2021.
//

import Foundation

final class URLRequestFactory {
    private static func generateURL(outOf endpoint: Endpoint) -> URL {
        guard let url = URL(string: endpoint.baseURL + endpoint.path) else {
            fatalError("You probably passed a wrong URL,\n check \(endpoint.baseURL) or \(endpoint.path)")
        }
        return url
    }
    
    private static func encodeParametersInURL(in urlRequest: inout URLRequest, endpoint: Endpoint) {
        guard let url = urlRequest.url?.absoluteString else { return }
        guard var urlComponents = URLComponents(string: url) else { return }
        urlComponents.queryItems = endpoint.parameters.map { key, value in
            URLQueryItem(name: key, value: value as? String ?? "")
        }
        
        urlComponents.percentEncodedQuery = urlComponents.percentEncodedQuery?.replacingOccurrences(of: "+", with: "%2B")
        
        urlRequest.url = urlComponents.url
    }
    
    private static func encodeParametersInBodyOfRequest(in request: inout URLRequest, endpoint: Endpoint) {
        do {
            let data = try JSONSerialization.data(withJSONObject: endpoint.parameters, options: [])
            request.httpBody = data
        } catch {
            print(error)
        }
        
    }
    
    private static func encodeRequestWithParameters(_ request: inout URLRequest, from endpoint: Endpoint) {
        switch endpoint.encoding {
        case .urlEncoding:
            encodeParametersInURL(in: &request, endpoint: endpoint)
        case .jsonEncoding:
            encodeParametersInBodyOfRequest(in: &request, endpoint: endpoint)
        }
    }
    
    static func generateRequest(outOf endpoint: Endpoint) -> URLRequest {
        let url = generateURL(outOf: endpoint)
        var urlRequest = URLRequest(url: url)
        
        urlRequest.httpMethod = endpoint.method.rawValue
        
        endpoint.headers.forEach { key, value in
            urlRequest.setValue(value, forHTTPHeaderField: key)
        }
        
        encodeRequestWithParameters(&urlRequest, from: endpoint)
        
        return urlRequest
    }
}

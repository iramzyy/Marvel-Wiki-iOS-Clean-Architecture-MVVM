//
//  Endpoint.swift
//  Marvel-Wiki
//
//  Created by Ramzy on 15/08/2021.
//

import Foundation

protocol Endpoint {
    var baseURL: String { get }
    var path: String { get }
    var headers: [String: String] { get }
    var parameters: [String: Any] { get }
    var encoding: ParametersEncoding { get }
    var method: HTTPMethod { get }
}

extension Endpoint {
    var baseURL: String {
        return "https://gateway.marvel.com:443/v1/public/"
    }
    
    var headers: [String: String] {
        return [:]
    }
}

enum ParametersEncoding {
    case urlEncoding
    case jsonEncoding
}

enum HTTPMethod: String {
    case GET
    case POST
}

//
//  NetworkError.swift
//  Marvel-Wiki
//
//  Created by Ramzy on 15/08/2021.
//

import Foundation

enum NetworkError: Error {
    case decodingError
    case somethingWentWrong
}

extension NetworkError {
    var localizedDescription: String {
        switch self {
        case .decodingError:
            return "Decoding error, please check your data model"
            
        case .somethingWentWrong:
            return "Something went wrong, please try again later"
        }
    }
}

extension Error {
    func shouldIgnore() -> Bool {
        switch self.localizedDescription {
        case "cancelled":
            return true
        default:
            return false
        }
    }
}

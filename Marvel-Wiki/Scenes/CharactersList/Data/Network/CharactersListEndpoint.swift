//
//  CharactersListEndpoint.swift
//  Marvel-Wiki
//
//  Created by Ramzy on 15/08/2021.
//

import Foundation
import Keys

enum CharactersListEndpoint {
    case getCharactersList
    
    
}

extension CharactersListEndpoint : Endpoint {
    
    var path: String {
        switch self {
        case .getCharactersList:
            return "characters"
        }
    }
    
    var parameters: [String : Any] {
        switch self {
        case .getCharactersList:
            return ["hash": MarvelWikiKeys().marvelWorldHash,
                    "apikey":MarvelWikiKeys().marvelWorldAPIKey,
                    "ts": MarvelWikiKeys().marvelWorldTS]
        }
    }
    
    var encoding: ParametersEncoding {
        switch self {
        case .getCharactersList:
            return .urlEncoding
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getCharactersList:
            return .GET
        }
    }
    
    
}


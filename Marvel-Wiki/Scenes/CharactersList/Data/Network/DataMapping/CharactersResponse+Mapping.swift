//
//  CharactersResponse+Mapping.swift
//  Marvel-Wiki
//
//  Created by Ramzy on 15/08/2021.
//

import Foundation

// MARK: - Data Transfer Object

struct CharactersResponseDTO: Codable {
    let code: Int
    let status: String
    let data: CharactersResultsDTO
}

extension CharactersResponseDTO {
    struct CharactersResultsDTO: Codable {
        let results: [CharactersDataDTO]
    }
    
    struct CharactersDataDTO: Codable {
        let id: Int
        let name, resultDescription: String
        let thumbnail: ThumbnailDTO
        
        
        enum CodingKeys: String, CodingKey {
            case id, name
            case resultDescription = "description"
            case thumbnail
        }
    }
    
    struct ThumbnailDTO: Codable {
        let path: String
        
        enum CodingKeys: String, CodingKey {
            case path
        }
    }
}


// MARK: - Mappings to Domain

extension CharactersResponseDTO {
    func toDomain() -> CharacterResponse {
        return .init(data: data.toDomain())
    }
}

extension CharactersResponseDTO.CharactersResultsDTO {
    func toDomain() -> CharactersResults {
        return .init(results: results.map({ $0.toDomain()}))
    }
}

extension CharactersResponseDTO.CharactersDataDTO {
    func toDomain() -> CharactersData {
        return .init(id: id, name: name, resultDescription: resultDescription, thumbnail: thumbnail.toDomain())
    }
}

extension CharactersResponseDTO.ThumbnailDTO {
    func toDomain() -> Thumbnail {
        return .init(path: path)
    }
}



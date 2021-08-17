//
//  Character.swift
//  Marvel-Wiki
//
//  Created by Ramzy on 15/08/2021.
//

import Foundation

struct CharacterResponse {
    let data: CharactersResults
}

struct CharactersResults {
    let results: [CharactersData]
}

struct CharactersData {
    let id: Int
    let name, resultDescription: String
    let thumbnail: Thumbnail
}

struct Thumbnail {
    let path: String
}

//
//  CharactersListItemViewModel.swift
//  Marvel-Wiki
//
//  Created by Ramzy on 15/08/2021.
//

import Foundation

struct CharactersListItemViewModel {
    let characterName: String
    let characterDescription: String
    let characterImage: String
    
    init(character: CharactersData) {
        self.characterName = character.name
        self.characterDescription = character.resultDescription
        self.characterImage = character.thumbnail.path + ".jpg"
    }
}

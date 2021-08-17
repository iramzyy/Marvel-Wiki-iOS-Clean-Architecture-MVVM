//
//  CharactersRepositoryInterfaces.swift
//  Marvel-Wiki
//
//  Created by Ramzy on 15/08/2021.
//

import Foundation

protocol CharactersRepository {
    func fetchCharactersList(completion: @escaping (Result<[CharactersData], Error>) -> Void)
}

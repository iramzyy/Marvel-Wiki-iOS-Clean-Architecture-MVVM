//
//  FetchCharactersUseCase.swift
//  Marvel-Wiki
//
//  Created by Ramzy on 15/08/2021.
//

import Foundation

protocol FetchCharactersUseCase {
    func execute(completion: @escaping (Result<[CharactersData], Error>) -> Void)
}

final class FetchCharactersUseCaseImpl: FetchCharactersUseCase {
    
    private let charactersRepository: CharactersRepository
    
    init(charactersRepository: CharactersRepository) {
        self.charactersRepository = charactersRepository
    }
    
    func execute(completion: @escaping (Result<[CharactersData], Error>) -> Void) {
        return charactersRepository.fetchCharactersList(completion: { result in
            completion(result)
        })
    }
}

//
//  CharactersRepository.swift
//  Marvel-Wiki
//
//  Created by Ramzy on 15/08/2021.
//

import Foundation

final class CharactersRepositoryImpl : CharactersRepository {
    private let network: NetworkProtocol
    
    init(network: NetworkProtocol) {
        self.network = network
    }
    
    func fetchCharactersList(completion: @escaping (Result<[CharactersData], Error>) -> Void) {
        network.call(CharactersListEndpoint.getCharactersList, CharactersResponseDTO.self) { (result) in
            switch result {
            case .success(let response):
                let characters = response.toDomain().data.results
                completion(.success(characters))
            case .failure(let error):
                completion(.failure(error))
                
            }
        }
    }
}

//
//  AppDIContainer.swift
//  Marvel-Wiki
//
//  Created by Ramzy on 15/08/2021.
//

import Foundation

final class AppDIContainer {
    
    // MARK: - Network
    lazy var network: NetworkProtocol = {
        return URLSessionClient.init()
    }()
    
    
    // MARK: - DIContainers of scenes
    func makeCharactersListDIContainer() -> CharactersListSceneDIContainer {
        let dependencies = CharactersListSceneDIContainer.Dependencies(network: network)
        return CharactersListSceneDIContainer(dependencies: dependencies)
        
    }
    
}

//
//  CharactersListFlowCoordinator.swift
//  Marvel-Wiki
//
//  Created by Ramzy on 15/08/2021.
//

import UIKit

protocol CharactersListFlowCoordinatorDependencies {
    func makeCharactersListViewController(actions: CharactersListViewModelActions) -> CharactersListViewController
    func makeCharacterDetialsViewController(character: CharactersData) -> UIViewController
}

final class CharactersListFlowCoordinator {
    private weak var navigationController: UINavigationController?
    private let dependencies: CharactersListFlowCoordinatorDependencies
    
    private weak var charactersListViewController: CharactersListViewController?
    
    init(navigationController: UINavigationController,
         dependencies: CharactersListFlowCoordinatorDependencies) {
        self.navigationController = navigationController
        self.dependencies = dependencies
    }
    
    func start() {
        let actions = CharactersListViewModelActions(showChracterDetail: navigateToCharacterDetails)
        let vc = dependencies.makeCharactersListViewController(actions: actions)
        navigationController?.pushViewController(vc, animated: false)
        charactersListViewController = vc
    }
    
    private func navigateToCharacterDetails(character: CharactersData) {
        let vc = dependencies.makeCharacterDetialsViewController(character: character)
        navigationController?.pushViewController(vc, animated: true)
    }
}

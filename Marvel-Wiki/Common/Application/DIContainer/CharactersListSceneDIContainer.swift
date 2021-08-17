//
//  CharactersListSceneDIContainer.swift
//  Marvel-Wiki
//
//  Created by Ramzy on 15/08/2021.
//

import UIKit

final class CharactersListSceneDIContainer: CharactersListFlowCoordinatorDependencies {
    
    struct Dependencies {
        let network: NetworkProtocol
    }
    
    private let dependencies: Dependencies
    
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
    
    // MARK:- Use Cases
    func makeCharactersListUseCase() -> FetchCharactersUseCase {
        return FetchCharactersUseCaseImpl(charactersRepository: makeCharactersRepository())
    }
    
    // MARK: - Repositories
    func makeCharactersRepository() -> CharactersRepository {
        return CharactersRepositoryImpl(network: dependencies.network)
    }
    
    // MARK: - Characters List  [View Controller - ViewModel]
    
    func makeCharactersListViewController(actions: CharactersListViewModelActions) -> CharactersListViewController {
        return CharactersListViewController.create(with: makeCharactersListViewModel(actions: actions))
    }
    
    func  makeCharactersListViewModel(actions:CharactersListViewModelActions) -> CharactersListViewModel {
        return CharactersListViewModel(fetchCharactersUseCase: makeCharactersListUseCase())
    }
    
    
    
    func makeCharacterDetialsViewController(character: CharactersData) -> UIViewController {
        return UIViewController()
    }
    
    // MARK: - Flow Coordinators
    func makeCharactersListFlowCoordinators(navigationController: UINavigationController) -> CharactersListFlowCoordinator {
        return CharactersListFlowCoordinator(navigationController: navigationController, dependencies: self)
    }
    
    
    
}

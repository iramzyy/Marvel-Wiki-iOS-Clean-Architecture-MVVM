//
//  AppFlowCoordinator.swift
//  Marvel-Wiki
//
//  Created by Ramzy on 15/08/2021.
//

import UIKit

final class AppFlowCoordinator {

    var navigationController: UINavigationController
    private let appDIContainer: AppDIContainer
    
    init(navigationController: UINavigationController,
         appDIContainer: AppDIContainer) {
        self.navigationController = navigationController
        self.appDIContainer = appDIContainer
    }

    func start() {
        // In App Flow we can check if user needs to login, if yes we would run login flow
        let charactersListSceneDIContainer = appDIContainer.makeCharactersListDIContainer()
        let flow = charactersListSceneDIContainer.makeCharactersListFlowCoordinators(navigationController: navigationController)
        flow.start()
    }
}


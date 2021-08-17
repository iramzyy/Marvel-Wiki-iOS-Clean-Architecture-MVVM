//
//  CharactersListViewModel.swift
//  Marvel-Wiki
//
//  Created by Ramzy on 15/08/2021.
//

import Foundation

struct CharactersListViewModelActions {
    let showChracterDetail: (CharactersData) -> Void
}

enum CharactersListViewModelLoading {
    case loading
}

protocol CharactersListViewModelInput {
    func viewDidLoad()
    func didSelectItem(at index: Int)
}

protocol CharactersListViewModelOutput {
    var items: Observable<[CharactersListItemViewModel]> { get }
    var loading: Observable<CharactersListViewModelLoading?> { get }
    var error: Observable<String> { get }
}

final class CharactersListViewModel: CharactersListViewModelInput, CharactersListViewModelOutput {
    var items: Observable<[CharactersListItemViewModel]> = Observable([])
    let loading: Observable<CharactersListViewModelLoading?> = Observable(.none)
    var error: Observable<String> = Observable("")
    
    private let fetchCharactersUseCase: FetchCharactersUseCase
    private let actions: CharactersListViewModelActions?
    private var characters: [CharactersData] = []
    
    
    init(fetchCharactersUseCase: FetchCharactersUseCase,
         actions: CharactersListViewModelActions? = nil) {
        self.fetchCharactersUseCase = fetchCharactersUseCase
        self.actions = actions
    }

    func viewDidLoad() {
        self.loading.value = .loading
        fetchCharactersUseCase.execute { result in
            switch result {
            case .success(let characters):
                self.characters = characters
                self.items.value = characters.map(CharactersListItemViewModel.init)
            case .failure(let error):
                print(error.localizedDescription)
            }
            self.loading.value = .none
        }
    }
    
    func didSelectItem(at index: Int) {
        
    }

}

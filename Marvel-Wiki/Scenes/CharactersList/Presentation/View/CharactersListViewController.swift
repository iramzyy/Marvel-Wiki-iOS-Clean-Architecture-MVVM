//
//  CharactersListVC.swift
//  Marvel-Wiki
//
//  Created by Ramzy on 15/08/2021.
//

import UIKit

class CharactersListViewController: UIViewController,StoryboardInstantiable {
    @IBOutlet weak var charactersList: UITableView!
    
    private var viewModel: CharactersListViewModel!

    // MARK: - Lifecycle
    static func create(with viewModel: CharactersListViewModel) -> CharactersListViewController{
        let view = CharactersListViewController.instantiateViewController()
        view.viewModel = viewModel
        return view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        bind(to: viewModel)
        viewModel.viewDidLoad()
    }
    
    private func bind(to viewModel: CharactersListViewModel) {
        viewModel.items.observe(on: self) {[weak self] _ in self?.reloadItems()}
        viewModel.loading.observe(on: self) { [weak self] in self?.updateLoading($0)}
    }
    
    
    private func updateLoading(_ loading: CharactersListViewModelLoading?) {
        SpinnerView.hide()
        switch loading {
        case .loading: SpinnerView.show()
        case .none: SpinnerView.hide()
        }
    }
    
    private func reloadItems() {
        charactersList.reloadData()
    }
}

extension CharactersListViewController: UITableViewDataSource, UITableViewDelegate {
    private func setupTableView() {
        charactersList.dataSource = self
        charactersList.delegate = self
        charactersList.register(UINib(nibName: CharactersListItemCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: CharactersListItemCell.reuseIdentifier)
        charactersList.estimatedRowHeight = CharactersListItemCell.height
        charactersList.rowHeight = UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.items.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CharactersListItemCell.reuseIdentifier) as? CharactersListItemCell else {
            assertionFailure("Cannot dequeue reusable cell \(CharactersListItemCell.self) with reuseIdentifier: \(CharactersListItemCell.reuseIdentifier)")
            return UITableViewCell()
        }
        
        cell.configure(with: viewModel.items.value[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CharactersListItemCell.height
    }
}

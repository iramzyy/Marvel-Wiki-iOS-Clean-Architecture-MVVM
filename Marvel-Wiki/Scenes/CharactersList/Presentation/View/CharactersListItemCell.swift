//
//  CharactersListItemCell.swift
//  Marvel-Wiki
//
//  Created by Ramzy on 15/08/2021.
//

import UIKit
import Kingfisher

class CharactersListItemCell: UITableViewCell {
    @IBOutlet weak var characterImage: UIImageView!
    @IBOutlet weak var characterName: UILabel!
    
    static let reuseIdentifier = String(describing: CharactersListItemCell.self)
    static let height = CGFloat(130)
    
    private var viewModel: CharactersListItemViewModel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    func configure(with viewModel: CharactersListItemViewModel) {
        self.viewModel = viewModel
        characterName.text = viewModel.characterName
        characterImage.kf.setImage(with: URL(string: viewModel.characterImage))
    }
}

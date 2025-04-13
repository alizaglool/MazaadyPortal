//
//  LanaguageTableViewCell.swift
//  MazaadyPortal
//
//  Created by Ali M. Zaghloul on 13/04/2025.
//

import UIKit

final class LanaguageTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var selectedImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    var isSelectedStatus: Bool = false {
        didSet {
            if isSelectedStatus {
                selectedImageView.image = SystemDesign.AppImages.radioFill.image
            } else {
                selectedImageView.image = SystemDesign.AppImages.radio.image
            }
        }
    }
    
    func configurLanguageCell(_ language: LanguageModel) {
        titleLabel.text = language.languageName
        
        if LocalizationManager.shared.getLanguage() == language.typeLanguage {
            selectedImageView.image = SystemDesign.AppImages.radioFill.image
        } else {
            selectedImageView.image = SystemDesign.AppImages.radio.image
        }
    }
    
}

//MARK: - Cell Identifier -

extension LanaguageTableViewCell {
    static func nib() -> UINib {
        return UINib(nibName: "LanaguageTableViewCell", bundle: nil)
    }
    static let identifier = "LanaguageTableViewCell"
}

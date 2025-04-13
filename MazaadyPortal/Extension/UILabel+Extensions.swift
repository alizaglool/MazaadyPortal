//
//  UILabel+Extensions.swift
//  MazaadyPortal
//
//  Created by Ali M. Zaghloul on 12/04/2025.
//

import Foundation
import UIKit

extension UILabel {
    func setStrikethroughText(_ text: String, color: UIColor = SystemDesign.AppColors.mergencyred.color) {
        let attributedString = NSAttributedString(
            string: text,
            attributes: [
                .strikethroughStyle: NSUnderlineStyle.single.rawValue,
                .foregroundColor: color
            ]
        )
        self.attributedText = attributedString
    }
}

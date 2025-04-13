//
//  File.swift
//  
//
//  Created by Zaghloul on 10/04/2025.
//

import UIKit

extension SystemDesign {
    public enum AppImages: String {
        case home = "home-ic"
        case profile = "profile-ic"
        case searchBar = "search-ic"
        case cart = "cart-ic"
        case setting, product, search
        case following, followers
        case comingSoon
        case radioFill, radio
        case send
 
        //return name of image
        public var name: String {
            return self.rawValue
        }
        
        //return image
        public var image: UIImage {
            return UIImage(named: self.rawValue) ?? UIImage()
        }
    }
}

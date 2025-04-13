//
//  File.swift
//  
//
//  Created by Zaghloul on 10/04/2025.
//

import Foundation

extension SystemDesign {
    public enum AppFonts: String {
        case NunitoRegular = "Nunito-Regular"
        case NunitoBold = "Nunito-Bold"
        case NunitoMedium = "Nunito-Medium"
        case NunitoSemiBold = "Nunito-SemiBold"
        
       public var name: String {
            return self.rawValue
        }
    }
}

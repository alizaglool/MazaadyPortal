//
//  LocalizationManager.swift
//  LocalizationManager
//
//  Created by Zaghloul on 10/04/2025.
//  Copyright © 2020 Ahmed Masoud. All rights reserved.
//


import Foundation
import UIKit

public protocol LocalizationDelegate: AnyObject {
    func resetAppAfterChangeLanguge()
}

public class LocalizationManager: NSObject {
    enum LanguageDirection {
        case leftToRight
        case rightToLeft
    }
    
    public enum Language: String {
        case English = "en"
        case Arabic = "ar"
        
        public var code: String {
            self.rawValue
        }
    }
    
    public static let shared = LocalizationManager()
    private var bundle: Bundle? = nil
    private var languageKey = "UKPrefLang"
    public weak var delegate: LocalizationDelegate?
    
    // get currently selected language from el user defaults
    public func getLanguage() -> Language? {
        if let languageCode = UserDefaults.standard.string(forKey: languageKey), let language = Language(rawValue: languageCode) {
            return language
        }
        return nil
    }
    
    // check if the language is available
    private func isLanguageAvailable(_ code: String) -> Language? {
        var finalCode = ""
        if code.contains("ar") {
            finalCode = "ar"
        } else if code.contains("en") {
            finalCode = "en"
        }
        return Language(rawValue: finalCode)
    }
    
    // check the language direction
    private func getLanguageDirection() -> LanguageDirection {
        if let lang = getLanguage() {
            switch lang {
            case .English:
                return .leftToRight
            case .Arabic:
                return .rightToLeft
            }
        }
        return .leftToRight
    }
    
    // get localized string for a given code from the active bundle
    func localizedString(for key: String, value comment: String) -> String {
        let localized = bundle!.localizedString(forKey: key, value: comment, table: nil)
        return localized
    }
    
    // set language for localization
    public func setLanguage(language: Language) {
        UserDefaults.standard.set(language.rawValue, forKey: languageKey)
        if let path = Bundle.main.path(forResource: language.rawValue, ofType: "lproj") {
            bundle = Bundle(path: path)
        } else {
            // fallback
            resetLocalization()
        }
        UserDefaults.standard.synchronize()
        resetApp()
    }
    
    // reset bundle
    func resetLocalization() {
        bundle = Bundle.main
    }
    
    // reset app for the new language
    func resetApp() {
        let dir = getLanguageDirection()
        var semantic: UISemanticContentAttribute!
        switch dir {
        case .leftToRight:
            semantic = .forceLeftToRight
            UITextField.appearance().textAlignment = .left
        case .rightToLeft:
            semantic = .forceRightToLeft
            UITextField.appearance().textAlignment = .right
        }
        UITabBar.appearance().semanticContentAttribute = semantic
        UIView.appearance().semanticContentAttribute = semantic
        UITextField.appearance().semanticContentAttribute = semantic
        UINavigationBar.appearance().semanticContentAttribute = semantic
        delegate?.resetAppAfterChangeLanguge()
    }
    
    // configure startup language
    public func setAppInnitLanguage() {
        if let selectedLanguage = getLanguage() {
            setLanguage(language: selectedLanguage)
        } else {
            // no language was selected
            let languageCode = Locale.preferredLanguages.first
            if let code = languageCode, let language = isLanguageAvailable(code) {
                setLanguage(language: language)
            } else {
                // default fall back
                setLanguage(language: .English)
            }
        }
        resetApp()
    }
}

extension String {
    public var localized: String {
        return LocalizationManager.shared.localizedString(for: self, value: "")
    }
}

//
//  Home.swift
//  TON
//
//  Created by Zaghloul on 10/04/2025.
//

import UIKit

protocol UserHomeCoordinatorProtocol {
    //main tab bar
    func showMainTabBar(selectIndex: Int)
    func getHomeViewController() -> UIViewController
    func getSearchViewController() -> UIViewController
    func getCartViewController() -> UIViewController
    func getProfileViewController() -> UIViewController
    
    // MARK: -
    func getChooesLanguageViewController()
}

extension HomeCoordinator {
    // MARK: - Main TabBar -
    
    func showMainTabBar(selectIndex: Int) {
        let mainTabBar = MainTabBarController(selectIndex: selectIndex)
        mainTabBar.coordinator = self
        show(viewController: mainTabBar)
    }
    
    func getHomeViewController() -> UIViewController {
        return UIViewController()
    }
    
    func getSearchViewController() -> UIViewController {
        return UIViewController()
    }
    
    func getCartViewController() -> UIViewController {
        return UIViewController()
    }
    
    func getProfileViewController() -> UIViewController {
        let viewModel = ProfileViewModel(coordinator: self)
        let viewController = ProfileViewController(viewModel: viewModel)
        return viewController
    }
    
    func getChooesLanguageViewController() {
        let viewModel = LanguageViewModel()
        let viewController = LanaguageViewController(coordinator: self, viewModel: viewModel)
        viewController.modalTransitionStyle = .coverVertical
        viewController.modalPresentationStyle = .overCurrentContext
        presentViewController(viewController: viewController)
    }
}

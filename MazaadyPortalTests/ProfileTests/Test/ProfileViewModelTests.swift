//
//  ProfileViewModelTests.swift
//  MazaadyPortal
//
//  Created by Ali M. Zaghloul on 13/04/2025.
//


import XCTest
import RxSwift
import RxCocoa
@testable import MazaadyPortal

final class ProfileViewModelTests: XCTestCase {

    private var viewModel: ProfileViewModel!
    private var mockAPI: MockProductAPI!
    private var mockCoordinator: MockHomeCoordinator!
    private var disposeBag: DisposeBag!

    override func setUp() {
        super.setUp()
        mockAPI = MockProductAPI()
        mockCoordinator = MockHomeCoordinator()
        disposeBag = DisposeBag()

        // Use a dummy cache manager that does nothing
        let dummyCacheManager = DummyProfileCacheManager()
        let dependencies = ProfileViewModelDependencies(api: mockAPI, cache: dummyCacheManager)
        viewModel = ProfileViewModel(coordinator: mockCoordinator, api: mockAPI, dependencies: dependencies)
    }

    override func tearDown() {
        viewModel = nil
        mockAPI = nil
        mockCoordinator = nil
        disposeBag = nil
        super.tearDown()
    }

    func testFetchUserInformation_success_emitsDisplayNameAndUsername() {
        let user = UserModel(id: 0, name: "Ali", image: "", userName: "zaghloul", followingCount: 5, followersCount: 10, countryName: "Egypt", cityName: "Cairo")
        mockAPI.userResult = .success(user)

        let displayNameExpectation = expectation(description: "Display name updated")
        let usernameExpectation = expectation(description: "Username updated")

        viewModel.displayName
            .skip(1)
            .subscribe(onNext: { name in
                XCTAssertEqual(name, "Ali")
                displayNameExpectation.fulfill()
            })
            .disposed(by: disposeBag)

        viewModel.username
            .skip(1)
            .subscribe(onNext: { username in
                XCTAssertEqual(username, "@zaghloul")
                usernameExpectation.fulfill()
            })
            .disposed(by: disposeBag)

        viewModel.fetchData()

        wait(for: [displayNameExpectation, usernameExpectation], timeout: 1.0)
    }

    func testFetchProducts_success_updatesRelay() {
        mockAPI.productsResult = .success([
            ProductModel(id: 0, name: "iPhone", image: "", price: 32, currency: "", offer: 0, endDate: 323.3)
        ])

        let expectation = self.expectation(description: "Products updated")

        viewModel.products
            .skip(1)
            .subscribe(onNext: { products in
                XCTAssertEqual(products.count, 1)
                XCTAssertEqual(products.first?.name, "iPhone")
                expectation.fulfill()
            })
            .disposed(by: disposeBag)

        viewModel.fetchProducts()

        wait(for: [expectation], timeout: 1.0)
    }

    func testDidSelectSegment_updatesSelectedSegment() {
        viewModel.didSelectSegment(index: 2)
        XCTAssertEqual(viewModel.selectedProfileTabsSegment.value, .followers)
    }

    func testGetLanguageTapped_callsCoordinator() {
        viewModel.getLanguageTapped()
        XCTAssertTrue(mockCoordinator.didCallGetLanguageVC)
    }
}

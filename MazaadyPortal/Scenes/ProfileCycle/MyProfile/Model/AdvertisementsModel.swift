//
//  AdvertisementsModel.swift
//  MazaadyPortal
//
//  Created by Ali M. Zaghloul on 11/04/2025.
//


// MARK: - AdvertisementsModel
struct AdvertisementsModel: Codable {
    let advertisements: [Advertisement]?
}

// MARK: - Advertisement
struct Advertisement: MyProductsProtocol, Codable {
    let id: Int?
    let image: String?
}

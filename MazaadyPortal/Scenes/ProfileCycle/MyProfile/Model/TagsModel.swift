//
//  TagsModel.swift
//  MazaadyPortal
//
//  Created by Ali M. Zaghloul on 11/04/2025.
//


// MARK: - TagsModel
struct TagsModel: Codable {
    let tags: [Tag]?
}

// MARK: - Tag
struct Tag: MyProductsProtocol, Codable {
    let id: Int?
    let name: String?
}

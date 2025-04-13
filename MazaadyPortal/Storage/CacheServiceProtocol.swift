//
//  CacheServiceProtocol.swift
//  MazaadyPortal
//
//  Created by Ali M. Zaghloul on 10/04/2025.
//

import Foundation

protocol CacheServiceProtocol {
    associatedtype T: Codable
    func save(_ object: T)
    func load() -> T?
    func clear()
}


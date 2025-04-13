//
//  File.swift
//
//
//  Created by Zaghloul on 10/04/2025.
//

import Foundation
import Alamofire

public enum ProductTarget {
    case getUserInfromation
    case getAdvertisements
    case getProducts
    case getTags
}

extension ProductTarget: TargetType {
    public var baseURL: String {
        return EndPoints.baseURL.value
    }
    
    public var path: String {
        switch self {
        case .getUserInfromation:
            return "user"
        case .getAdvertisements:
            return "advertisements"
        case .getProducts:
            return "products"
        case .getTags:
            return "tags"
        }
    }
    
    public var method: HTTPMethod {
        switch self {
        default:
            return .get
        }
    }
    
    public var task: Task {
        switch self {
        default:
            return .requestPlain
        }
    }
    
    public var headers: [String : String]? {
        return [:]
    }
    
}


//
//  File.swift
//  
//
//  Created by Zaghloul on 10/04/2025.
//

import Foundation

public enum EndPoints: String {
    
    case baseURL = "https://stagingapi.mazaady.com/api/interview-tasks/"
    
    public var value: String {
        return self.rawValue
    }
}

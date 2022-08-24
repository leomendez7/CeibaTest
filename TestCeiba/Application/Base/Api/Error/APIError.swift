//
//  APIError.swift
//  TestCeiba
//
//  Created by Leonardo Mendez on 23/08/22.
//

import Foundation

enum AppError: Error, LocalizedError {
    
    case `default`
    case iCloud
    case custom(message: String)
    
    var errorDescription: String? {
        return localizedDescription
    }
    
    var localizedDescription: String {
        switch self {
        case .custom(let message):
            return message
        case .iCloud:
            return "Please connect to iCloud on your settings"
        default:
            return "Something went wrong, please try again later."
        }
    }
}

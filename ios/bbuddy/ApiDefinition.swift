//
//  Api.swift
//  bbuddy
//
//  Created by Jackson Zhang on 07/02/2017.
//  Copyright © 2017 odd-e. All rights reserved.
//

import Foundation
import Moya

enum ApiDefinition {
    case signIn(email: String, password: String)
    case getUser(id: Int)
    case getAccounts
    case addAccount(account: DTO.Account)
    case updateAccount(account: DTO.Account)
    case deleteAccount(account: DTO.Account)
}

protocol Authorizable {
    var shouldAuthorize: Bool { get }
}

// MARK: - TargetType Protocol Implementation
extension ApiDefinition: TargetType, Authorizable {
    internal var shouldAuthorize: Bool {
        switch self {
        case .signIn:
            return false
        default:
            return true
        }
    }

    var baseURL: URL {
        #if TEST
            return URL(string: "http://localhost:4000")!
        #else
            return URL(string: "http://localhost:3000")!
        #endif
    }
    var path: String {
        switch self {
        case .signIn:
            return "/auth/sign_in"
        case .getUser(let id):
            return "/users/\(id)"
        case .getAccounts, .addAccount:
            return "/accounts"
        case .updateAccount(let account), .deleteAccount(let account):
            return "/accounts/\(account.id)"
        }
    }
    var method: Moya.Method {
        switch self {
        case .getUser, .getAccounts:
            return .get
        case .signIn, .addAccount:
            return .post
        case .updateAccount:
            return .put
        case .deleteAccount:
            return .delete
        }
    }
    var parameters: [String: Any]? {
        switch self {
        case .getUser, .getAccounts, .deleteAccount:
            return nil
        case .signIn(let email, let password):
            return ["email": email, "password": password]
        case .addAccount(let account), .updateAccount(let account):
            return ["name": account.name, "balance": account.balance]
        }
    }
    var parameterEncoding: ParameterEncoding {
        switch self {
        case .signIn, .addAccount, .updateAccount:
            return JSONEncoding.default
        default:
            return URLEncoding.default
        }
    }
    var sampleData: Data {
        switch self {
        case .signIn(let email, _):
            return "{\"id\": 100, \"email\": \"\(email)\", \"token\": \"FAKETOKEN\"}".utf8Encoded
        case .getUser(let id):
            return "{\"id\": \(id), \"first_name\": \"Harry\", \"last_name\": \"Potter\"}".utf8Encoded
        case .getAccounts:
            // Provided you have a file named accounts.json in your bundle.
            guard let path = Bundle.main.path(forResource: "accounts", ofType: "json"),
                let data = Data(base64Encoded: path) else {
                    return Data()
            }
            return data
        case .deleteAccount(let account), .updateAccount(let account), .addAccount(let account):
            return "{\"id\": \(account.id), \"name\": \(account.name), \"balance\": \(account.balance)}".utf8Encoded
        }
    }
    var task: Task {
        return .request
    }
}

// MARK: - Helpers
private extension String {
    var urlEscaped: String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
    
    var utf8Encoded: Data {
        return self.data(using: .utf8)!
    }
}

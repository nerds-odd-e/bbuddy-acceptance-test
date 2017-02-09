//
//  Api.swift
//  bbuddy
//
//  Created by Jackson Zhang on 07/02/2017.
//  Copyright © 2017 odd-e. All rights reserved.
//

import Foundation
import Moya

enum Api {
    case signIn(email: String, password: String)
    case showUser(id: Int)
    case showAccounts
}

protocol Authorizable {
    var shouldAuthorize: Bool { get }
}

struct AuthorizedToken {
    let uid: String
    let client: String
    let accessToken: String
    let type: String
}

struct AuthPlugin: PluginType {
    let tokenClosure: () -> AuthorizedToken?
    
    func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
        guard
            let token = tokenClosure(),
            let target = target as? Authorizable,
            target.shouldAuthorize
            else {
                return request
        }
        
        var request = request
        request.addValue(token.type, forHTTPHeaderField: "token-type")
        request.addValue(token.uid, forHTTPHeaderField: "uid")
        request.addValue(token.client, forHTTPHeaderField: "client")
        request.addValue(token.accessToken, forHTTPHeaderField: "access-token")
        return request
    }
}

// MARK: - TargetType Protocol Implementation
extension Api: TargetType, Authorizable {
    internal var shouldAuthorize: Bool {
        switch self {
        case .signIn:
            return false
        default:
            return true
        }
    }

    var baseURL: URL { return URL(string: "http://192.168.2.13:3000")! }
    var path: String {
        switch self {
        case .signIn:
            return "/auth/sign_in"
        case .showUser(let id):
            return "/users/\(id)"
        case .showAccounts:
            return "/accounts"
        }
    }
    var method: Moya.Method {
        switch self {
        case .showUser, .showAccounts:
            return .get
        case .signIn:
            return .post
        }
    }
    var parameters: [String: Any]? {
        switch self {
        case .showUser, .showAccounts:
            return nil
        case .signIn(let email, let password):
            return ["email": email, "password": password]
        }
    }
    var parameterEncoding: ParameterEncoding {
        switch self {
        case .signIn:
            return JSONEncoding.default
        default:
            return URLEncoding.default
        }
    }
    var sampleData: Data {
        switch self {
        case .signIn(let email, _):
            return "{\"id\": 100, \"email\": \"\(email)\", \"token\": \"FAKETOKEN\"}".utf8Encoded
        case .showUser(let id):
            return "{\"id\": \(id), \"first_name\": \"Harry\", \"last_name\": \"Potter\"}".utf8Encoded
        case .showAccounts:
            // Provided you have a file named accounts.json in your bundle.
            guard let path = Bundle.main.path(forResource: "accounts", ofType: "json"),
                let data = Data(base64Encoded: path) else {
                    return Data()
            }
            return data
        }
    }
    var task: Task {
        switch self {
        case .signIn, .showUser, .showAccounts:
            return .request
        }
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

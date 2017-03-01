//
//  AuthPlugin.swift
//  bbuddy
//
//  Created by Jackson Zhang on 10/02/2017.
//  Copyright © 2017 odd-e. All rights reserved.
//

import Foundation
import Moya
import Result

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
    
    func didReceive(_ result: Result<Response, MoyaError>, target: TargetType) {
        if let headers = (result.value?.response as? HTTPURLResponse)?.allHeaderFields,
            let uid = headers["uid"] as? String,
            let client = headers["client"] as? String,
            let accessToken = headers["access-token"] as? String,
            let type = headers["token-type"] as? String {
            User.save([.token: accessToken, .email: uid, .client: client, .type: type])
        }
    }
}

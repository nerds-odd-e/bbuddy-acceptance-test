//
//  User.swift
//  bbuddy
//
//  Created by Jackson Zhang on 06/02/2017.
//  Copyright © 2017 odd-e. All rights reserved.
//

import Foundation
import Cely

struct User: CelyUser {
    
    enum Property: CelyProperty {
        case email = "email"
        case token = "token"
        case client = "client"
        case type = "type"
        
        func securely() -> Bool {
            switch self {
            case .token:
                return true
            default:
                return false
            }
        }
        
        func persisted() -> Bool {
            switch self {
            case .email:
                return true
            default:
                return false
            }
        }
        
        func save(_ value: Any) {
            Cely.save(value, forKey: rawValue, securely: securely(), persisted: persisted())
        }
        
        func get() -> Any? {
            return Cely.get(key: rawValue)
        }
    }
}

// MARK: - Save/Get User Properties

extension User {
    
    static func save(_ value: Any, as property: Property) {
        property.save(value: value)
    }
    
    static func save(_ data: [Property : Any]) {
        data.forEach { property, value in
            property.save(value)
        }
    }
    
    static func get(_ property: Property) -> Any? {
        return property.get()
    }
}

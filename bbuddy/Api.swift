//
//  Api.swift
//  bbuddy
//
//  Created by Jackson Zhang on 10/02/2017.
//  Copyright © 2017 odd-e. All rights reserved.
//

import Foundation
import Moya
import Cely
import Argo

class Api {
    private let provider  = MoyaProvider<ApiDefinition>(
        plugins: [
            AuthPlugin(tokenClosure: {
                if
                    let uid = User.get(.email) as? String,
                    let client = User.get(.client) as? String,
                    let accessToken = User.get(.token) as? String,
                    let type = User.get(.type) as? String {
                    return AuthorizedToken(
                        uid: uid,
                        client: client,
                        accessToken: accessToken,
                        type: type
                    )
                }
                return nil
            })
        ]
    )
    
    private func request(_ method: ApiDefinition, handler: @escaping (Response)->Void){
        provider.request(method) { result in
            switch result {
            case .success(let response):
                switch response.statusCode {
                case 200...299:
                    handler(response)
                case 401:
                    Cely.logout()
                default:
                    print("error: \(response.statusCode)")
                }
            case .failure(let error):
                print("failure: \(error)")
            }
        }
    }
    
    private func mapArray<T:Decodable>(_ response: Response) throws -> [T] where T == T.DecodedType {
        do {
            //map to JSON
            let JSON = try response.mapJSON()
            
            //decode with Argo
            let decodedArray:Decoded<[T]>
            //no root key, it's an array
            guard let array = JSON as? [AnyObject] else {
                throw DecodeError.typeMismatch(expected: "\(T.DecodedType.self)", actual: "\(type(of: JSON))")
            }
            decodedArray = decode(array)
            
            //return array of decoded objects, or throw decoding error
            return try decodedValue(decoded: decodedArray)
        } catch {
            throw error
        }
    }
    
    private func decodedValue<T>(decoded: Decoded<T>) throws -> T {
        switch decoded {
        case .success(let value):
            return value
        case .failure(let error):
            throw error
        }
    }
    
    func signIn(_ email: String, password: String, action: @escaping () -> Void){
        request(.signIn(email: email, password: password)) { _ in
            Cely.changeStatus(to: .loggedIn)
            action()
        }
    }
    
    func getAccounts(_ action: @escaping ([DTO.Account]) -> Void) {
        request(.getAccounts) { [unowned me = self] response in
            do {
                action(try me.mapArray(response))
            } catch {
                
            }
        }
    }
    
    func addAccount(_ account: DTO.Account, to action: @escaping () -> Void) {
        request(.addAccount(account: account)) { _ in
            action()
        }
    }
    
    func updateAccount(_ account: DTO.Account, to action: @escaping () -> Void){
        request(.updateAccount(account: account)) { _ in
            action()
        }
    }
    
    func deleteAccount(_ account: DTO.Account, to action: @escaping () -> Void){
        request(.deleteAccount(account: account)) { _ in
            action()
        }
    }
    
    func addBudget(_ budget: DTO.Budget, to action: @escaping () -> Void) {
        request(.addBudget(budget: budget)) { _ in
            action()
        }
    }

    func getBudgets(_ action: @escaping ([DTO.Budget]) -> Void) {
        request(.getBudgets) { [unowned me = self] response in
            do {
                action(try me.mapArray(response))
            } catch {

            }
        }
    }
}

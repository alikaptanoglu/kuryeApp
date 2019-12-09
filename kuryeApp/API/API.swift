//
//  API.swift
//  ServiceMoyaExample
//
//  Created by Nihat Basmacı on 6.12.2019.
//  Copyright © 2019 Nihat Basmacı. All rights reserved.
//

import UIKit
import Moya
import ServiceSpaceX






// ******

struct ProductsEndPoints {
    var getCategories: String = "ticimaxapi/products/GetCategories"
    var login:String = "api/token"
    var profil:String = "api/profil"
}

enum API {
    case zen
    case login
    case profil
}

extension API: TargetType {
    var baseURL: URL { return URL(string: "https://dev.ticimax.net/")! }
    
    var path: String {
        switch self {
        case .zen:
            return ProductsEndPoints().getCategories
        case .login:
            return ProductsEndPoints().login
        case .profil:
            return ProductsEndPoints().profil
        }
    }
    
    var validate: Bool {
        switch self {
        case .login:
            return true
        case .zen:
            return true
        case .profil:
            return true
        }
    }
    var method: Moya.Method {
        switch self {
        case .zen:
            return .get
        case .login:
            return .post
        case .profil:
            return .get
        }
    }
    var task: Task {
        switch self {
        case .zen:
            
            return .requestParameters(parameters: ["IsShowHomeCategoryCloud":true], encoding: URLEncoding.default)
        case .login:
            var parameters = [String: String]()
            parameters["grant_type"] = "password"
            parameters["username"] = "nihatbasmaci@hotmail.com"
            parameters["password"] = "123123"
            return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
        case .profil:
            return .requestParameters(parameters: ["IsShowHomeCategoryCloud":true], encoding: URLEncoding.default)
        }
    }
    
    var sampleData: Data {
        return "".utf8Encoded
    }
    
    var validationType: ValidationType {
        return .none
    }
    var headers: [String: String]? {
        var parameters = [String: String]()
        parameters["langcode"] = "tr"
        parameters["TicimaxAuthKey"] = "546963696d6178205765622041504920466f722044656e697a627574696b2032303138"
        guard let token = TokenManager.accessToken else { return parameters }
        parameters["Authorization"] = "Bearer " + token
        return parameters
    }
}
// MARK: - Helpers
private extension String {
    var urlEscaped: String {
        return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }

    var utf8Encoded: Data {
        return data(using: .utf8)!
    }
}

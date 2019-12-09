//
//  Model.swift
//  ServiceMoyaExample
//
//  Created by Nihat Basmacı on 6.12.2019.
//  Copyright © 2019 Nihat Basmacı. All rights reserved.
//

import UIKit

public struct BaseModel<T>: Decodable  where T: Decodable {
    public var model: T?
    public var isError: Bool?
    public var message: String?
    
    public init() {
        
    }
    enum CodingKeys: String, CodingKey {
        case model
        case isError
        case message
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        model = try values.decode(T?.self, forKey: .model)
        isError = try values.decode(Bool?.self, forKey: .isError)
        message = try values.decode(String?.self, forKey: .message)
        
        
    }
}
struct CategoryResponseModel : Codable {
    let descriptionField : String?
    let id : Int?
    let image : String?
    let name : String?
    let value : String?
    let order : Int?
    let subCategories : [CategoryResponseModel]?
}


public class TokenModel: NSObject,Codable {
    var access_token:String?
    var token_type:String?
    var expires_in:TimeInterval?
    var refresh_token:String?
    var id_token:String?
    var token_resource:String?
    var error:String?
    var error_description:String?
    var expireTimeInterval : String?
}

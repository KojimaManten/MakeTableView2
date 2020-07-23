//
//  QiitaAPI.swift
//  MakeTableView2
//
//  Created by 小島満天 on 2020/07/23.
//  Copyright © 2020 Manchen. All rights reserved.
//

import Foundation
import APIKit

protocol QiitaAPI: Request {
    
}

extension QiitaAPI {
    var baseURL: URL {
        return URL(string: "https://qiita.com/api/v2")!
    }
}

extension QiitaAPI where Response: Decodable {
    var dataParser: DataParser {
        return DecodableDataParser()
    }
    
    func response(from object: Any, urlResponse: HTTPURLResponse) throws -> Response {
        guard let data = object as? Data else {
            throw ResponseError.unexpectedObject(object)
        }
        return try JSONDecoder().decode(Response.self, from: data)
    }
}

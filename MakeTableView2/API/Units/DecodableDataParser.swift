//
//  DecodableDataParser.swift
//  MakeTableView2
//
//  Created by 小島満天 on 2020/07/23.
//  Copyright © 2020 Manchen. All rights reserved.
//

import Foundation
import APIKit

class DecodableDataParser: APIKit.DataParser {
    //データの中身をString?型で返す
    var contentType: String? {
        return "application/json"
    }
    
    //返ってきたデータをパースする
    func parse(data: Data) throws -> Any {
        return data
    }
    
    
}

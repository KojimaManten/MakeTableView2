//
//  FetchiQiitaArticleRequest.swift
//  MakeTableView2
//
//  Created by 小島満天 on 2020/07/23.
//  Copyright © 2020 Manchen. All rights reserved.
//

//記事一覧を取得するリクエスト
import Foundation
import APIKit

struct FetchiQiitaArticleRequest: QiitaAPI {
    
    var baseURL: URL
    
    typealias Response = [Articles]
    
    var method: HTTPMethod {
        return .get
    }
    
    var path: String {
        return "/items"
    }
}

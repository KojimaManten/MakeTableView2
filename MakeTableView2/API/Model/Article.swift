//
//  Article.swift
//  MakeTableView2
//
//  Created by 小島満天 on 2020/07/23.
//  Copyright © 2020 Manchen. All rights reserved.
//

import Foundation
//レスポンスのデータ構造の定義

struct Articles: Codable {
    let title: String
    let url: String
    let user: User
}

struct User: Codable {
    let name: String
    let profile_image_url: String
}

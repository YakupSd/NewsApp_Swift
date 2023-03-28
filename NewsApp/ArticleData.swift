//
//  ArticleData.swift
//  NewsApp
//
//  Created by Yakup Suda on 28.03.2023.
//

import Foundation
struct ArticleData: Codable{
    let author: String?
    let title: String?
    let urlToImage: String?
    let content: String?
}

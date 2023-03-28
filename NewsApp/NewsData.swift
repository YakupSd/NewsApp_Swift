//
//  NewsData.swift
//  NewsApp
//
//  Created by Yakup Suda on 28.03.2023.
//

import Foundation
struct NewsData:Codable {
    let status: String
    let articles:[ArticleData]
    
}

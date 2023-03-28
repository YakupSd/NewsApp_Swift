//
//  NewsContentHomeVC.swift
//  NewsApp
//
//  Created by Yakup Suda on 28.03.2023.
//

import UIKit

class NewsContentHomeVC: UIViewController {
    
    @IBOutlet weak var newsAuthor: UILabel!
    @IBOutlet weak var newsContent: UILabel!
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var newsTitle: UILabel!
    
    var newsDetail: ArticleData = ArticleData(author: "", title: "", urlToImage: "", content: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newsTitle.text = newsDetail.title
        if newsDetail.urlToImage != nil {
            
            let url = URL(string: newsDetail.urlToImage!)
            newsImage.downloadImage(from: url!)
            newsImage.contentMode = .scaleAspectFit
        }
        else {
            newsImage.image = UIImage(named: "empty")
            
        }
        newsContent.text = newsDetail.content
        newsAuthor.text = newsDetail.author
        
        
        
    }
    
    
    
    
}

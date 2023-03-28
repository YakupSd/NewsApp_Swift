//
//  ViewController.swift
//  NewsApp
//
//  Created by Yakup Suda on 28.03.2023.
//

import UIKit

class NewsViewController: UIViewController {
    
    var articleList = [ArticleData]()
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchData()
    }
    
    func fetchData(){
    
        let apiKey = ""
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=\(apiKey)")
        let dataTask = URLSession.shared.dataTask(with: url!) { data, response, error in
            guard let data = data, error == nil else {
                print("URL Error")
                return
            }
            var newsFullList: NewsData?
            do {
                newsFullList = try JSONDecoder().decode(NewsData.self, from: data)
            } catch{
                print("Error JSON")
            }
            self.articleList = newsFullList!.articles
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        }
        dataTask.resume()
    }
    
}

extension UIImageView{
    
    func imageSize(from image: UIImage){
       
    }
    
    
    func downloadImage(from url:URL)
    {
        contentMode = .scaleToFill
        let dataTask = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200,
                  let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                  let data = data, error == nil,
                  let image = UIImage(data: data)
            else
            {
                return
            }
            DispatchQueue.main.async {
                //self.newsImage.image = image
                self.image = image
                
            }
        }
        dataTask.resume()
    }
}


extension NewsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articleList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newsCell", for: indexPath) as!
        NewsTableCell
        if articleList[indexPath.row].author != nil {
            cell.newsAuthor.text = "Yazar : \(articleList[indexPath.row].author!)"
        }else {
            cell.newsAuthor.text = "Yazar Yok"
        }
        cell.newsName.text = articleList[indexPath.row].title
        if articleList[indexPath.row].urlToImage != nil {
            let url = URL(string: articleList[indexPath.row].urlToImage!)
            cell.newsImage.downloadImage(from: url!)
            cell.newsImage.contentMode = .scaleToFill
        }
        else {
            cell.newsImage.image = UIImage(named: "empty")
            
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "NewsContentHome") as? NewsContentHomeVC
        vc?.newsDetail = articleList[indexPath.row]
       
        navigationController?.pushViewController(vc!, animated: true)
    }
}

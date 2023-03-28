//
//  NewsTableCell.swift
//  NewsApp
//
//  Created by Yakup Suda on 28.03.2023.
//

import UIKit

class NewsTableCell: UITableViewCell {

    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var newsAuthor: UILabel!
    @IBOutlet weak var newsName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        newsImage.image = nil
    }

}

//
//  NewsTableViewCell.swift
//  VKapp1
//
//  Created by Nikita on 11/4/22.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    @IBOutlet weak var whoPostedImage: UIImageView!
    @IBOutlet weak var whoPostedName: UILabel!
    @IBOutlet weak var postDate: UILabel!
    @IBOutlet weak var postTitle: UILabel!
    @IBOutlet weak var postedImage: UIImageView!
    @IBOutlet weak var viewsCounter: UILabel!
    @IBOutlet weak var thumbsUpImage: UIButton!
    @IBOutlet weak var counterLabel: UILabel?
    //    @IBOutlet weak var postLikeControl: PostLikeControl!
    
    var markedAsLiked: ((Bool) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        whoPostedImage.layer.masksToBounds = true
        whoPostedImage.layer.cornerRadius = whoPostedImage.frame.size.height / 2
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

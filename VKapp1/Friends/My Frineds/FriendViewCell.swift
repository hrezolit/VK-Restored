//
//  FrindViewCell.swift
//  VKapp1
//
//  Created by Nikita on 25/3/22.
//

import UIKit

class FriendViewCell: UITableViewCell {
    
    @IBOutlet weak var pictureBackground: UIView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userPicture: UIImageView!
    
    
    //MARK: - awakeFromNib
    override func awakeFromNib() {
        super.awakeFromNib()
        
        pictureBackground.layer.masksToBounds = true
        pictureBackground.layer.cornerRadius = pictureBackground.frame.size.height / 2
        
        userPicture.layer.shadowColor = UIColor.black.cgColor
        userPicture.layer.shadowRadius = 0.1
        userPicture.layer.shadowOpacity = 0.2
        userPicture.layer.shadowOffset = CGSize(width: 5, height: 5)
        
        
    }
    
    
    //MARK: - setSelected
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        let imageTap = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        
        userPicture.isUserInteractionEnabled = true
        userPicture.addGestureRecognizer(imageTap)
        
    }
    
    @objc func imageTapped(_ sender: UITapGestureRecognizer) {
        
        UIView.animate(withDuration: 0.25,
                       delay: 0,
                       usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 0,
                       options: UIImageView.AnimationOptions.allowUserInteraction,
                       animations: {
            self.pictureBackground.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            self.userPicture.transform = CGAffineTransform(scaleX: 1.08, y: 1.08)
        }) { _ in
            UIView.animate(withDuration: 0.15,
                           delay: 0,
                           usingSpringWithDamping: 0.5,
                           initialSpringVelocity: 0,
                           options: UIImageView.AnimationOptions.allowUserInteraction,
                           animations: {
                self.pictureBackground.transform = CGAffineTransform(scaleX: 1, y: 1)
                self.userPicture.transform = CGAffineTransform(scaleX: 1, y: 1)
            })
            
        }
    }
}



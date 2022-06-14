//
//  UnsubscribedTableViewCell.swift
//  VKapp1
//
//  Created by Nikita on 27/3/22.
//

import UIKit

class UnsubscribedTableViewCell: UITableViewCell {
    
    @IBOutlet weak var unSubscribedGroupName: UILabel!
    @IBOutlet weak var unSubscribedGroupPicture: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        unSubscribedGroupPicture.layer.shadowColor = UIColor.black.cgColor
        unSubscribedGroupPicture.layer.shadowRadius = 0.1
        unSubscribedGroupPicture.layer.shadowOpacity = 0.2
        unSubscribedGroupPicture.layer.shadowOffset = CGSize(width: 5, height: 5)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        let imageTap = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        
        unSubscribedGroupPicture.isUserInteractionEnabled = true
        unSubscribedGroupPicture.addGestureRecognizer(imageTap)
        
    }
    
    @objc func imageTapped(_ sender: UITapGestureRecognizer) {
        
        UIView.animate(withDuration: 0.25,
                       delay: 0,
                       usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 0,
                       options: UIImageView.AnimationOptions.allowUserInteraction,
                       animations: {
            self.unSubscribedGroupPicture.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            self.unSubscribedGroupPicture.transform = CGAffineTransform(scaleX: 1.08, y: 1.08)
        }) { _ in
            UIView.animate(withDuration: 0.15,
                           delay: 0,
                           usingSpringWithDamping: 0.5,
                           initialSpringVelocity: 0,
                           options: UIImageView.AnimationOptions.allowUserInteraction,
                           animations: {
                self.unSubscribedGroupPicture.transform = CGAffineTransform(scaleX: 1, y: 1)
                self.unSubscribedGroupPicture.transform = CGAffineTransform(scaleX: 1, y: 1)
            })
            
        }
    }
    
}

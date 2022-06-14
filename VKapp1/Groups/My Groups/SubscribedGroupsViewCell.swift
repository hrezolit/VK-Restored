//
//  GroupsViewCell.swift
//  VKapp1
//
//  Created by Nikita on 25/3/22.
//

import UIKit

class SubscribedGroupsViewCell: UITableViewCell {

    @IBOutlet weak var subscribedGroupName: UILabel!
    @IBOutlet weak var subscribedGroupPicture: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        subscribedGroupPicture.layer.shadowColor = UIColor.black.cgColor
        subscribedGroupPicture.layer.shadowRadius = 0.1
        subscribedGroupPicture.layer.shadowOpacity = 0.2
        subscribedGroupPicture.layer.shadowOffset = CGSize(width: 5, height: 5)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        let imageTap = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        
        subscribedGroupPicture.isUserInteractionEnabled = true
        subscribedGroupPicture.addGestureRecognizer(imageTap)
        
    }
    @objc func imageTapped(_ sender: UITapGestureRecognizer) {
        
        UIView.animate(withDuration: 0.25,
                       delay: 0,
                       usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 0,
                       options: UIImageView.AnimationOptions.allowUserInteraction,
                       animations: {
            self.subscribedGroupPicture.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        }) { _ in
            UIView.animate(withDuration: 0.15,
                           delay: 0,
                           usingSpringWithDamping: 0.5,
                           initialSpringVelocity: 0,
                           options: UIImageView.AnimationOptions.allowUserInteraction,
                           animations: {
                self.subscribedGroupPicture.transform = CGAffineTransform(scaleX: 1, y: 1)
            })
            
        }
    }

}

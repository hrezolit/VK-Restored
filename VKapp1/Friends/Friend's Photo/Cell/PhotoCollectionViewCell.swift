//
//  PhotoCollectionViewCell.swift
//  VKapp1
//
//  Created by Nikita on 25/3/22.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var likeControl: LikeControl!
    @IBOutlet weak var friendPhotos: UIImageView!
    
    var markedAsLiked: ((Bool) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        stackView.isUserInteractionEnabled = false
        
        likeControl.addTarget(self, action: #selector(likeControlTapped), for: .touchUpInside)
        
        friendPhotos.isUserInteractionEnabled = true
        
    }
    
    @objc func likeControlTapped() {
        likeControl.isSelected = !likeControl.isSelected
        markedAsLiked?(likeControl.isSelected)
        UIView.animate(withDuration: 0.3,
                       delay: 0,
                       usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 0,
                       options: [ UIImageView.AnimationOptions.allowUserInteraction, .curveEaseInOut],
                       animations: {
            self.likeControl.imageView?.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            
        }) { _ in
            UIView.animate(withDuration: 0.3,
                           delay: 0,
                           usingSpringWithDamping: 0.5,
                           initialSpringVelocity: 0,
                           options: [ UIImageView.AnimationOptions.allowUserInteraction, .curveEaseInOut],
                           animations: {
                self.likeControl.imageView?.transform = CGAffineTransform(scaleX: 1, y: 1)
            })
            
        }
    }
    
    
}

//
//  LikeControll.swift
//  VKapp1
//
//  Created by Nikita on 3/4/22.
//

import UIKit

class LikeControl: UIControl {
    
    var likeCounter: Int = 0
    
    @IBOutlet weak var imageView: UIImageView?
    @IBOutlet weak var counterLabel: UILabel?
    
    override var isSelected: Bool {
        didSet {
            guard oldValue != isSelected else { return }
            imageView?.image = isSelected ? UIImage(systemName: "hand.thumbsup.fill") : UIImage(systemName: "hand.thumbsup")
            
            if isSelected {
                likeCounter += 1
            } else {
                likeCounter -= 1
            }
            counterLabel?.text = "\(likeCounter)"
        }
    }
}

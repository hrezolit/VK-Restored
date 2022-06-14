//
//  FriendsAlphabetHeade.swift
//  VKapp1
//
//  Created by Nikita on 13/4/22.
//

import UIKit

class FriendsAlphabetHeaderView: UITableViewHeaderFooterView {
    
    @IBOutlet weak var backGround: UIView!
    @IBOutlet weak var letterLabel: UILabel!
    
    var gradient = CAGradientLayer()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backGround.layoutIfNeeded()
        
        backGround.frame.size.height = 30
        
        gradient.startPoint = CGPoint(x: CGFloat(0), y: CGFloat(1))
        gradient.endPoint = CGPoint(x: CGFloat(1), y: CGFloat(1))
        gradient.frame = backGround.bounds
        gradient.colors = [ UIColor(#colorLiteral(red: 1, green: 0.3430038691, blue: 0, alpha: 1)).cgColor,
                            UIColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)).cgColor]
        gradient.locations = [0.0 ,0.6 ,1.0]
        backGround.layer.insertSublayer(gradient, at: 0)
        
    }
    
}

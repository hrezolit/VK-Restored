//
//  Utilities.swift
//  VKapp
//
//  Created by Nikita on 7/3/22.
//

import Foundation
import UIKit

class Utilities {
    static func styleTextField(_ textField: UITextField) {
        
        let bottomLine = CALayer()
        
        bottomLine.frame = CGRect(x: 0, y: textField.frame.height - 13, width: textField.frame.width, height: 1)
        bottomLine.backgroundColor = UIColor.init(red: 255/255, green: 255/255, blue: 255/255, alpha: 1).cgColor
        textField.borderStyle = .none
        textField.layer.addSublayer(bottomLine)
        
    }
    
    static func styleFilledButton(_ button: UIButton) {
        
        button.backgroundColor = UIColor.init(red: 32/255, green: 111/255, blue: 242/255, alpha: 1)
        button.layer.cornerRadius = 15.0
        button.tintColor = UIColor.white
        
    }
    
    static func styleEmptyButton(_ button: UIButton) {
        
        button.layer.borderWidth = 1.5
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.cornerRadius = 15.0
        button.tintColor = UIColor.black
        button.alpha = 0.8
        
    }
    
    static func isPasswordCorrect(_ password: String) -> Bool {
        let passwordExample = NSPredicate(format: "SELF MATCHES @%", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        return passwordExample.evaluate(with: password)
    }
}

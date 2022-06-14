//
//  DismissSegue.swift
//  VKapp1
//
//  Created by Nikita on 20/4/22.
//

import UIKit


class DismissSegue: UIStoryboardSegue {
    
    override func perform() {
        
        UIView.animateKeyframes(
            withDuration: 1.5,
            delay: 0,
            options: [],
            animations: {
                
                UIView.addKeyframe(
                    withRelativeStartTime: 0.25,
                    relativeDuration: 0.75,
                    animations: {
                        self.source.view.transform = CGAffineTransform(rotationAngle: .pi / 2)
                        self.source.view.frame = CGRect(x: -self.source.view.frame.width,
                                                        y: self.source.view.frame.minX,
                                                        width: self.source.view.frame.width,
                                                        height: self.source.view.frame.height)
                    })
                
            }) { isComplete in
                
                self.source.dismiss(animated: false)
            }
    }
    
}

//
//  PresentSegue.swift
//  VKapp1
//
//  Created by Nikita on 20/4/22.
//

import UIKit

class PresentSegue: UIStoryboardSegue {
    
    override func perform() {
        
        guard  let containerView = source.view.superview else { return }
        
        containerView.addSubview(destination.view)
        
        destination.view.frame = CGRect(x: source.view.frame.maxX,
                                        y: -source.view.frame.width,
                                        width: source.view.frame.width,
                                        height: source.view.frame.height)
        
        destination.view.transform = CGAffineTransform(rotationAngle: -.pi / 2)
        
        UIView.animateKeyframes(
            withDuration: 1.5,
            delay: 0,
            options: [],
            animations: {
                
                UIView.addKeyframe(
                    withRelativeStartTime: 0,
                    relativeDuration: 0.75,
                    animations: {
                        self.destination.view.center = self.source.view.center
                    })
                
                UIView.addKeyframe(
                    withRelativeStartTime: 0,
                    relativeDuration: 0.75,
                    animations: {
                        self.destination.view.transform = .identity
                    })
                
                
            }) { isComplete in
                
                self.source.present(self.destination, animated: false)
                
            }
    }
    
}

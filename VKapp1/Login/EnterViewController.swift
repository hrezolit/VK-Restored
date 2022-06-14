//
//  EnterViewController.swift
//  VKapp1
//
//  Created by Nikita on 9/3/22.
//
import AVKit
import AVFoundation
import UIKit

class EnterViewController: UIViewController {
    
    //MARK: - Properties
    @IBOutlet weak var enteringPersonLabel: UILabel!
    @IBOutlet weak var closeButtonLable: UIButton!
    
    @IBOutlet weak var leftDot: UIView!
    @IBOutlet weak var centerDot: UIView!
    @IBOutlet weak var rightDot: UIView!
    
    var enteringPerson : String!
    
    
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        enteringPersonLabel.text = "Hello, God!"
        enteringPersonLabel.font = UIFont(name: "Chalkduster", size: 35)
        enteringPersonLabel.textColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        
        closeButtonLable.layer.cornerRadius = 25
        closeButtonLable.alpha = 0.8
        closeButtonLable.tintColor = .white
        closeButtonLable.backgroundColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
        
        // Timer settings for animatingThreeDots
        Timer.scheduledTimer(timeInterval: 4, target: self, selector: #selector(timeToMoveOn), userInfo: nil, repeats: false)
        
        leftDot.layer.cornerRadius = leftDot.frame.size.height / 2
        centerDot.layer.cornerRadius = leftDot.frame.size.height / 2
        rightDot.layer.cornerRadius = leftDot.frame.size.height / 2
        
        leftDot.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        centerDot.backgroundColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
        rightDot.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        
    }
    
    //MARK: - viewDidAppear
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        animatingThreeDots()
    }
    
    //Action for activity indicator when it stopped
    @objc func timeToMoveOn() {
        self.performSegue(withIdentifier: "goToMainScreen", sender: self)
        
    }
    
    func animatingThreeDots() {
        UIView.animateKeyframes(withDuration: 1, delay: 0, options: [.repeat, .autoreverse], animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.25) { [self] in
                self.leftDot.layer.opacity = 0
                self.leftDot.transform = CGAffineTransform(scaleX: 1.12, y: 1.12)
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.25) {
                self.centerDot.layer.opacity = 0
                self.centerDot.transform = CGAffineTransform(scaleX: 1.12, y: 1.12)
                
            }
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.25) {
                self.rightDot.layer.opacity = 0
                self.rightDot.transform = CGAffineTransform(scaleX: 1.12, y: 1.12)
            }
            
        }, completion: nil)
    }
}



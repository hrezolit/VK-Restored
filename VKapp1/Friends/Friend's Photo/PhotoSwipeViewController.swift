//
//  PhotoSwipeViewController.swift
//  VKapp1
//
//  Created by Nikita on 18/4/22.
//

import UIKit

class PhotoSwipeViewController: UIViewController {
    
    @IBOutlet weak var firstImageView: UIImageView!
    @IBOutlet weak var secondImageView: UIImageView!
    
    var photos = [Size]()
    
    //MARK: - checking photo index
    var curentPhotoIndex: Int?
    
    var nextPhotoIndex: Int? {
        guard let index = curentPhotoIndex else { return nil }
        let nextIndex = index + 1
        return nextIndex < photos.count ? nextIndex : nil
    }
    
    var previousPhotoIndex: Int? {
        guard let index = curentPhotoIndex else { return nil }
        let previousIndex = index - 1
        return previousIndex > -1 ? previousIndex : nil
    }
    
    var curentPhoto: Size? {
        guard let index = curentPhotoIndex else { return nil }
        return photos[index]
    }
    
    var curentImageView: UIImageView? {
        [firstImageView, secondImageView].first(where: { !$0.isHidden } )
    }
    var hiddenImageView: UIImageView? {
        [firstImageView, secondImageView].first(where: { $0.isHidden } )
    }
    
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        curentPhotoIndex = photos.isEmpty ? nil : 0
        
        firstImageView.frame = view.bounds
//        firstImageView.image = curentPhoto?.albumID
        secondImageView.frame = view.bounds
        secondImageView.isHidden = true
        
    }
    
    //MARK: - viewWillAppear
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(viewDidSwipe(_:)))
        leftSwipe.direction = .left
        
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(viewDidSwipe(_:)))
        rightSwipe.direction = .right
        
        view.addGestureRecognizer(leftSwipe)
        view.addGestureRecognizer(rightSwipe)
    }
    
    @objc func viewDidSwipe (_ sender: UISwipeGestureRecognizer) {
        switch sender.direction {
            
        case .left:
            swipeToLeft()
        case .right:
            swipeToRight()
        default:
            break
            
        }
        
    }
    
    
    func swipeToLeft() {
        guard let nextPhotoIndex = nextPhotoIndex else {
            return
        }
        let hiddenImageView = hiddenImageView
        let currentImageView = curentImageView
        
//        hiddenImageView?.image = UIImage(named: photos[nextPhotoIndex].image)
        hiddenImageView?.frame.origin.x = view.bounds.maxX
        hiddenImageView?.isHidden = false
        
        UIView.animateKeyframes(withDuration: 0.9,
                                delay: 0,
                                options: [],
                                animations: {
            
            UIView.addKeyframe(withRelativeStartTime: 0,
                               relativeDuration: 0.25,
                               animations: {
                currentImageView?.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.25,
                               relativeDuration: 0.75,
                               animations: {
                hiddenImageView?.frame.origin.x = 0
                currentImageView?.frame.origin.x = -self.view.bounds.width
            })
            
        },
                                completion: {_ in
            
            self.curentPhotoIndex = nextPhotoIndex
            currentImageView?.isHidden = true
            currentImageView?.transform = .identity
            
        })
        
    }
    
    func swipeToRight() {
        guard let previousPhotoIndex = previousPhotoIndex else {
            return
        }
        
        let hiddenImageView = hiddenImageView
        let currentImageView = curentImageView
        
//        hiddenImageView?.image = UIImage(named: photos[previousPhotoIndex].image)
        hiddenImageView?.frame.origin.x = -view.bounds.width
        hiddenImageView?.isHidden = false
        
        UIView.animateKeyframes(withDuration: 0.9,
                                delay: 0,
                                options: [],
                                animations: {
            
            UIView.addKeyframe(withRelativeStartTime: 0,
                               relativeDuration: 0.25,
                               animations: {
                currentImageView?.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.25,
                               relativeDuration: 0.75,
                               animations: {
                hiddenImageView?.frame.origin.x = 0
                currentImageView?.frame.origin.x = self.view.bounds.width
            })
            
        },
                                completion: {_ in
            
            self.curentPhotoIndex = previousPhotoIndex
            currentImageView?.isHidden = true
            currentImageView?.transform = .identity
            
        })
        
    }
    
}


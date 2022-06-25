//
//  PhotosCollectionViewController.swift
//  VKapp1
//
//  Created by Nikita on 23/3/22.
//

import UIKit

///  photos controller
class PhotosCollectionViewController: UICollectionViewController {
    
    var friendIndex: Int = 0
    var photoOwnerID: Int = 0
    
    let photoService = PhotoService()
    var photoData = [PhotosData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        guard let photoOwnerID = photoOwnerID else { return }
        
        photoService.loadPhotoVK(ownerID: photoOwnerID) { result in
            switch result {
            case .success(let photo):
                DispatchQueue.main.async {
                    self.photoData = photo
                    self.collectionView.reloadData()
                }
                
            case .failure(_):
                return
            }
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoData.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotosCell", for: indexPath) as? PhotoCollectionViewCell
        let photoR = photoData
            .map { $0.sizes }
            .flatMap { $0 }
            .filter { $0.type == "r" }
//        let likes = photoData.map {$0.likes }.flatMap { $0 }
        
        cell?.friendPhotos.loadImage(with: photoR[indexPath.item].url)
//        cell?.likeControl.isSelected = likes
//        cell?.markedAsLiked = { isSelected in
//            photoData[self.friendIndex].likes[indexPath.row] = isSelected
//        }
        return cell ?? UICollectionViewCell()
    }
    
    //MARK: - prepare for segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let swipeViewController = segue.destination as? PhotoSwipeViewController {
            let photoR = photoData
                .map { $0.sizes }
                .flatMap { $0 }
                .filter { $0.type == "r" }
            swipeViewController.photos = photoR
            navigationController?.navigationBar.tintColor = .clear
            navigationController?.navigationItem.titleView?.backgroundColor = .clear
            
        }
    }
    //MARK: - unwindSegue
    @IBAction func unwindSegue(_ unwindSegue: UIStoryboardSegue) {
        if let photoCollectionView = unwindSegue.destination as? PhotosCollectionViewController {
            photoCollectionView.navigationController?.isNavigationBarHidden = false
            photoCollectionView.navigationController?.navigationBar.tintColor = #colorLiteral(red: 0, green: 0.4802438617, blue: 0.9985234141, alpha: 1)
            photoCollectionView.navigationController?.navigationItem.titleView?.backgroundColor = #colorLiteral(red: 0, green: 0.4802438617, blue: 0.9985234141, alpha: 1)
        }
    }
    
}

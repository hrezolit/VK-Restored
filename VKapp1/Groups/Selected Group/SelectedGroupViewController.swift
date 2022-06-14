//
//  SelectedGroupViewController.swift
//  VKapp1
//
//  Created by Nikita on 27/3/22.
//

import UIKit

class SelectedGroupViewController: UIViewController {
    
    @IBOutlet weak var selectedGroupImage: UIImageView!
    @IBOutlet weak var selectedGroupLabel: UILabel!
    
    var groupTitle = ""
    var groupImage = UIImage(systemName: "eye.slash")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        selectedGroupImage.image = groupImage
        selectedGroupLabel.text = groupTitle
        selectedGroupLabel.numberOfLines = 1
    }
}

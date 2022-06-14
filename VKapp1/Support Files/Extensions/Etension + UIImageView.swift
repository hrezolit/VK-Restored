//
//  Extension + UIImageView.swift
//  VKapp1
//
//  Created by Nikita on 9/6/22.
//

import UIKit

extension UIImageView {
    
    func loadImage(with url: String) {
        
        self.image = nil
        
        let imageURL = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        
        if let url = URL(string: imageURL) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                DispatchQueue.main.async {
                    if let data = data {
                        if let image = UIImage(data: data) {
                            self.image = image
                        }
                    }
                }
            }.resume()
        }
    }
}

//
//  PhotosVK.swift
//  VKapp1
//
//  Created by Nikita on 31/5/22.
//

import Foundation
import RealmSwift

/// model for landing JSON data for photos
struct PhotosVK: Decodable {
    
    /// response
    let response: ResponsePhotos
}

/// model for landing JSON data for photos
struct ResponsePhotos: Decodable {

    /// array of photos
    let items: [PhotosData]
    
}

/// model for landing JSON data for photos
class PhotosData: Object, Decodable {
    
    /// type of album "wall", "page"
    @objc dynamic var albumID = ""

    /// selected friend's id
    @objc dynamic var ownerID = 0
    
    /// the date when photo was uploaded
    @objc dynamic var date = 0
    
    /// photo ID
    @objc dynamic var id = 0
    
    /// photo likes class with counters of likes
    @objc dynamic var likes: Likes?

    /// size of photo
    var sizes = List<Size>()
    
    enum CodingKeys: String, CodingKey {

        case ownerID = "owner_id"
        case albumID = "album_id"
        case date
        case id
        case sizes
        case likes
    }
    
    override class func primaryKey() -> String? {
        return "id"
    }
}

/// model for landing JSON data for photos likes
class Likes: Object, Decodable {
    
    /// like counter
    @objc dynamic var count = 0
    
    /// my likes
    @objc dynamic var userLikes = 0
    
    enum CodingKeys: String, CodingKey {
        case count
        case userLikes = "user_likes"
    }
}

/// model for landing JSON data for photos sizes
class Size: Object, Decodable {
    
    ///  photo's height
    @objc dynamic var height = 0
    
    /// photo's url
    @objc dynamic var url = ""
    
    /// photo's type
    @objc dynamic var type = ""
    
    /// photo's width
    @objc dynamic var width = 0
}





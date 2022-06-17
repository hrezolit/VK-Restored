//
//  PhotosVK.swift
//  VKapp1
//
//  Created by Nikita on 31/5/22.
//

import Foundation

/// model for landing JSON data for photos
struct PhotosVK: Codable {
    
    /// response
    let response: ResponsePhotos
}

/// model for landing JSON data for photos
struct ResponsePhotos: Codable {
    
    /// photos count
    let count: Int
    
    /// array of photos
    let items: [PhotosData]
    // MARK: - Response
    
}

/// model for landing JSON data for photos
struct PhotosData: Codable {
    
    /// album ID:  "wall" - photos from the wall,  "profile" - profile photos
    let albumID: Int
    
    /// the date when photo was uploaded
    let date: Int
    
    /// photo ID
    let id: Int
    
    /// album's owner's ID
    let ownerID: Int?
    
    /// the date when photo was uploaded
    let postID: Int?
    
    /// size of photo
    let sizes: [Size]
    
    let likes: Likes
    
    /// text
    let text: String
    
    enum CodingKeys: String, CodingKey {
        case albumID = "album_id"
        case date = "date"
        case id = "id"
        case ownerID = "owner_id"
        case postID = "post_id"
        case sizes = "sizes"
        case likes
        case text = "text"
    }
}

/// model for landing JSON data for photos likes
struct Likes: Codable {
    
    /// like counter
    let count: Int
    
    /// my likes
    let userLikes: Int
    
    enum CodingKeys: String, CodingKey {
        case count
        case userLikes = "user_likes"
    }
}

/// model for landing JSON data for photos sizes
struct Size: Codable {
    
    ///  photo's height
    let height: Int
    
    /// photo's url
    let url: String
    
    /// photo's type
    let type: String
    
    /// photo's width
    let width: Int
}



import RealmSwift

class FPResponse: Object, Decodable {
    let response: FriendsPhotosResponse
}

class FriendsPhotosResponse: Object, Decodable {
    let items: [PhotosList]
}

class PhotosList: Object, Decodable {
    var albumID = 0
    var ownerID = 0
    var photoID = 0
    var imageURL = ""
    var sizeType = ""
    var likesCount = 0
    var userLike = 0
}





//
//  UserVK.swift
//  VKapp1
//
//  Created by Nikita on 25/3/22.
//

import Foundation
import RealmSwift

/// model for landing JSON data for friends
struct FResponse: Decodable {
    let response: FriendsListResponse
}

/// model for landing JSON data for friends
struct FriendsListResponse: Decodable {
    /// array of friends
    let items: [FriendsData]
}

/// model for landing JSON data for friends
class FriendsData: Object, Decodable {
    
    /// user id
    @objc dynamic var id: Int = 0
    
    /// user's photo
    @objc dynamic var photo100: String = ""
    
    /// user's first name
    @objc dynamic var firstName: String = ""
    
    /// user's last name
    @objc dynamic var lastName: String = ""
    
    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case photo100 = "photo_100"
    }
    
    override class func primaryKey() -> String? {
        "id"
    }
    
}

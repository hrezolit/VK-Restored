//
//  UserVK.swift
//  VKapp1
//
//  Created by Nikita on 25/3/22.
//

import Foundation

/// model for landing JSON data for friends
class UserVK: Codable {
    
    /// response
    let response: ResponseFriends
}

/// model for landing JSON data for friends
struct ResponseFriends: Codable {
    
    /// users count
    let count: Int
    
    ///  array of users
    let items: [UserData]
}

/// model for landing JSON data for friends
struct UserData: Codable {
    
    /// user ID, information about the communities
    let id: Int
    
    /// user date of birth
    let birthday: String?
    
    /// user first name
    let firstName: String
    
    /// user last name
    let lastName: String
    
    /// user icon
    let photo100: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case birthday = "bdate"
        case firstName = "first_name"
        case lastName = "last_name"
        case photo100 = "photo_100"
    }
}

import RealmSwift

class FriendsList: Object, Decodable {
    @objc dynamic var id: Int = 0
    @objc dynamic var birthday: String = ""
    @objc dynamic var photo100: String = ""
    @objc dynamic var firstName: String = ""
    @objc dynamic var lastName: String = ""
    
}

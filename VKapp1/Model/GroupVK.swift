//
//  GroupVK.swift
//  VKapp1
//
//  Created by Nikita on 25/3/22.
//

import Foundation
import RealmSwift

/// model for landing JSON data for groups
struct GroupsVK: Decodable {
    let response: ResponseGroups
}

/// model for landing JSON data for groups
struct ResponseGroups: Decodable {
    let items: [GroupData]
}

/// model for landing JSON data for groups
class GroupData: Object, Decodable {
    
    /// group identification number
    @objc dynamic var id = 0
    
    /// group name
    @objc dynamic var name = ""

    /// group icon
    @objc dynamic var photo100 = ""
    
    enum CodingKeys: String, CodingKey {
        case id
        case name = "name"
        case photo100 = "photo_100"
    }
    
    override class func primaryKey() -> String? {
        "id"
    }
}

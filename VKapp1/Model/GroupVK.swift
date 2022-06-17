//
//  GroupVK.swift
//  VKapp1
//
//  Created by Nikita on 25/3/22.
//

import Foundation

/// model for landing JSON data for groups
struct GroupsVK: Codable {
    let response: ResponseGroups
}

/// model for landing JSON data for groups
struct ResponseGroups: Codable {
    let items: [GroupData]
}

/// model for landing JSON data for groups
struct GroupData: Codable {
    
    /// group identification number
    let id: Int
    
    /// group name
    let name: String
    
    /// group type: groupe, page, event
    let type: TypeEnum
    
    /// group icon
    let photo100: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name = "name"
        case type = "type"
        case photo100 = "photo_100"
    }
}

enum TypeEnum: String, Codable {
    case group = "group"
    case page = "page"
}


import RealmSwift

class GResponse: Object, Decodable {
    let response: GroupsResponse
}

class GroupsResponse: Object, Decodable {
    let items: [GroupsList]
}

class GroupsList: Object, Decodable {
    var id = 0
    var descriptions = ""
    var membersCount = 0
    var name = ""
    var type = ""
    var photo100 = ""
}

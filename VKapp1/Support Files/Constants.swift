//
//  Constants.swift
//  VKapp1
//
//  Created by Nikita on 2/6/22.
//

import Foundation

//  Storage for constants
struct Constants {
    /// Constants for service layer
    enum Service: String, CaseIterable {
        enum Paths: String, CaseIterable {
            case friendsGet = "/method/friends.get"
            case groupsGet = "/method/groups.get"
            case photosGet = "/method/photos.get"
//            case serchGroupGet = "/method/groups.search"
        }
        /// Service layer Error
        enum ServiceError: Error {
            ///  Parsing Error
            case parseError
            /// URL not configured
            case notConfigureURL
            /// Request Error
            case requestError(Error)
        }
        /// Request's scheme
        case scheme = "https"
        /// Request's host
        case host = "api.vk.com"
        /// Request type "GET"
        case get = "GET"
        /// Request type "POST"
        case post = "POST"
    }
}

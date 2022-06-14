//
//  FriendService.swift
//  VKapp1
//
//  Created by Nikita on 2/6/22.
//

import Foundation

/// class for requesting and extracting friends data
final class FriendService {
    typealias FriendsResult = Result<[UserData], Constants.Service.ServiceError>

    private let session: URLSession = {
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        return session
    }()

    /// Fetching friends data
    /// - Parameter completion: closure for extracting result
    func loadFriendVK(completion: @escaping (FriendsResult) -> ()) {
        guard let token = MySession.shared.token else {
            return completion(.failure(.notConfigureURL))
        }

        let params: [String: String] = [
            "v" : "5.131",
            "fields": "bdate, photo_100, online"
        ]

        do {
            let url: URL = try .configureUrl(token: token,
                                             method: .friendsGet,
                                             params: params)
            
            var request = URLRequest(url: url)
            
            request.httpMethod = Constants.Service.get.rawValue
            
            session.dataTask(with: request) { data, _, error in
                guard let data = data, error == nil else {
                    return
                }
                
                let decoder = JSONDecoder()
                
                do {
                    let result = try decoder.decode(UserVK.self, from: data)
                    completion(.success(result.response.items))
                    
                } catch {
                    completion(.failure(.parseError))
                }
            }.resume()
        } catch {
            completion(.failure(.notConfigureURL))
        }
    }
}

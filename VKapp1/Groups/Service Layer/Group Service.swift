//
//  GroupService.swift
//  VKapp1
//
//  Created by Nikita on 2/6/22.
//

import Foundation
import RealmSwift

/// class for requesting and extracting group data
final class GroupService {
    typealias GroupResult = Result<[GroupData], Constants.Service.ServiceError>

    private let session: URLSession = {
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        return session
    }()
    
    /// Preparing functional for saving data in Realm class
    /// - Parameter groupsData: model for Realm
    func save(_ groupsData: [GroupData]) {
        do {
            let realm = try Realm()
            realm.beginWrite()
            realm.add(groupsData)
            try realm.commitWrite()
        } catch {
            print("DBG", error)
        }
    }

    /// Fetching group data
    /// - Parameter completion: closure for extracting result
    func loadGroupsVK(completion: @escaping (GroupResult) -> ()) {
        guard let token = MySession.shared.token else {
            return completion(.failure(.notConfigureURL))
        }

        let params: [String: String] = [
            "extended" : "1",
            "v" : "5.131"
        ]

        do {
            let url: URL = try .configureUrl(token: token,
                                             method: .groupsGet,
                                             params: params)
            
            var request = URLRequest(url: url)
            
            request.httpMethod = Constants.Service.get.rawValue
            
            session.dataTask(with: request) { data, _, error in
                guard let data = data, error == nil else {
                    return
                }
                
                let decoder = JSONDecoder()
                
                do {
                    let result = try decoder.decode(GroupsVK.self, from: data)
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

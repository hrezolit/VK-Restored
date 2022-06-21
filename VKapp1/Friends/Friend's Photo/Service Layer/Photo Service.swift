//
//  PhotoService.swift
//  VKapp1
//
//  Created by Nikita on 2/6/22.
//

import Foundation
import RealmSwift

/// class for requesting and extracting photo data
final class PhotoService {
    typealias PhotoResult = Result<[PhotosData], Constants.Service.ServiceError>
    
    private let session: URLSession = {
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        return session
    }()
    
    /// Preparing functional for saving data in Realm class
    /// - Parameter photoData: model for Realm
    func save(_ photoData: PhotosList) {
        do {
            let realm = try Realm()
            realm.beginWrite()
            realm.add(photoData)
            try realm.commitWrite()
        } catch {
            print("DBG", error)
        }
    }
    
    /// Fetching photos data
    /// - Parameter completion: closure for extracting result
    func loadPhotoVK(ownerID: Int, completion: @escaping (PhotoResult) -> ()) {
        guard let token = MySession.shared.token else {
            return completion(.failure(.notConfigureURL))
        }
        
        let params: [String: String] = [
            "owner_id" : "\(ownerID)",
            "album_id" : "wall",
            "v" : "5.131",
            "extended" : "1"
        ]
        
        do {
            let url: URL = try .configureUrl(token: token,
                                             method: .photosGet,
                                             params: params)
            
            var request = URLRequest(url: url)
            
            request.httpMethod = Constants.Service.get.rawValue
            
            session.dataTask(with: request) { data, _, error in
                guard let data = data, error == nil else {
                    return
                }
                
                let decoder = JSONDecoder()
                
                do {
                    let result = try decoder.decode(PhotosVK.self, from: data)
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


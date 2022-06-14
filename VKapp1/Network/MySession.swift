//
//  MySession.swift
//  VKapp1
//
//  Created by Nikita on 24/5/22.
//

import Foundation

///  Signltone for VK secured information
final class MySession {
    
    
    /// Initialized singleton class "MySession" for global access
    static var shared = MySession()
    
    private init() {}
    
    
    /// Access token for using VK API methods
    var token: String?
    
    /// VK's Authorized user's indetification number
    var userID: String?
    
}

//
//  NetworkUtils.swift
//  UserList
//
//  Created by Sushmitha Ganesh on 12/20/23.
//

import Foundation

class NetworkUtils {
    let session: URLSession
    let token: String
    let usersURL: URL
    
    static public var standard : NetworkUtils {
        return NetworkUtils()
    }
        
    private init() {
        session = URLSession.shared
        usersURL = URL(string: "https://gorest.co.in/public/v2/users")!
        token = "733a25379dd71460100ce6f4fc23e9d156c523b5a6239cd45dd2796719e8a09a"
    }
    
    func getUsers() async -> [User] {
        do {
            var request = URLRequest(url: usersURL)
            request.httpMethod = "GET"
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
            let (userData, _) = try await session.data(for: request)
            return try JSONDecoder().decode([User].self, from: userData)
        }
        catch {
            print(error) 
        }
        return []
    }
    
    func addUser(user: User) async -> Bool {
        do {
            var request = URLRequest(url: usersURL)
            request.httpMethod = "POST"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.addValue("application/json", forHTTPHeaderField: "Accept")
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
            let newUserData = try JSONEncoder().encode(user)
            let (_, response) = try await session.upload(for: request, from: newUserData)
            if let httpResponse = response as? HTTPURLResponse {
                if httpResponse.statusCode ==  201 {
                    return true
                }
            }
        }
        catch {
            print(error)
        }
        return false
    }
}


//
//  ViewModel.swift
//  WebServices
//
//  Created by Biswapratik Maharana on 21/08/20.
//  Copyright © 2020 Biswapratik Maharana. All rights reserved.
//

import Foundation

let baseURl = "https://reqres.in/api/users/"


class ViewModel {
    
    var userInfo: [String: Any]?
    var userInfos: [String: Any]?
    
    func getUserDetails(userId: Int, successHandler: @escaping (([String: Any]) -> Void)) {
        
        // Step 1 - Creating the Request
        let urlString = baseURl + "\(userId)"
        guard let url = URL(string: urlString) else { return }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        
        //        urlRequest.httpBody = Data()
        //        urlRequest.setValue("text/html", forHTTPHeaderField: "Content-Type")
        
        // Step 2 - Sending the Request
        let session = URLSession.shared
        let task = session.dataTask(with: urlRequest) { [weak self] (data, response, error) in
            if error != nil {
                print("Error: \(String(describing: error))")
                return
            }
            guard let data = data else { return }
            do {
                self?.userInfo = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String : Any]
                successHandler(self?.userInfo ?? [:])
            } catch {
                print("Failed to parse: \(error)")
            }
        }
        task.resume()
        
    }
    
    func getUsersDetails(pageId: Int, successHandler: @escaping (([String: Any]) -> Void)) {
        
        // Step 1 - Creating the Request
        let urlString = baseURl
        guard let url = URL(string: urlString) else { return }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        
        // Adding Query Parameters
        var urlComponents: URLComponents = URLComponents()
        urlComponents.path = baseURl
        urlComponents.queryItems = [URLQueryItem(name: "page", value: "\(pageId)")]
          
        // Step 2 - Sending the Request
        let session = URLSession.shared
        let task = session.dataTask(with: urlRequest) { [weak self] (data, response, error) in
            if error != nil {
                print("Error: \(String(describing: error))")
                return
            }
            guard let data = data else { return }
            do {
                self?.userInfos = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String : Any]
                successHandler(self?.userInfos ?? [:])
            } catch {
                print("Failed to parse: \(error)")
            }
        }
        task.resume()
        
    }
    
}

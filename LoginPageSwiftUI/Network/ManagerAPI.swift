//
//  ManagerAPI.swift
//  LoginPageSwiftUI
//
//  Created by Farendza Muda on 06/09/22.
//

import Foundation
import Alamofire

public typealias FailureMessage = String

public class APIManager {
    public static let shared = APIManager()
    
    func callAPI(serverURL: String? = "", strURL: String, queryItems: [URLQueryItem]? = nil, method: HTTPMethod = .get, headers: HTTPHeaders? = nil, parameters: Parameters? = nil, success: @escaping((AFDataResponse<Any>) -> Void), failure: @escaping((FailureMessage) -> Void)) {
        var finalURL = serverURL ?? ""
        
        if let serverURL = serverURL, serverURL == "" {
            finalURL = AppConstants.serverURL
        }
        guard var url = URLComponents(string: "\(finalURL)\(strURL)") else {
            failure("Invalid URL")
            return
        }
        
        if let queryItems = queryItems {
            url.queryItems = queryItems
        }
        
        // Network request
        AF.request(url, method: method, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseJSON { response in
            switch response.result {
            case .success:
                success(response)
            case let .failure(error):
                failure(error.localizedDescription)
            }
        }
    }
}

//
//  ApiManager.swift
//  JGig-SwiftUI
//
//  Created by Joacim Nidén on 2020-04-29.
//  Copyright © 2020 Joacim Nidén. All rights reserved.
//

import Foundation
import Alamofire

class ApiManager {
  
  // MARK: - Vars
  
  private let baseUrl = "https://moshpitandcode.com/gigs/"
  
  enum Screen: String {
    case home = "?json"
    case bands = "bands/all?json"
    case gigs = "gigs/all?json"
  }
  
  // MARK: - Life cycle
  
  private init() { }
  

  func get<T:Decodable>(screen: Screen, _ callback: @escaping ((Result<T, Error>) -> Void)) {
    AF.request("\(baseUrl)\(screen.rawValue)").responseDecodable(of: T.self) { response in
      switch response.result {
      case .success(let decodable):
        callback(.success(decodable))
      case .failure(let error):
        callback(.failure(error))
      }
    }
  }
  
}

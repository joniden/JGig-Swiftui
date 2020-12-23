//
//  JGigApi.swift
//  JGig-SwiftUI
//
//  Created by Joacim Nidén on 2020-04-29.
//  Copyright © 2020 Joacim Nidén. All rights reserved.
//

import Foundation
import Combine

enum JGigApi {
  
  // MARK: - Enums
  
  enum Screen {
    case home,bands,gigs
    case band(Int)
    
    var path: String {
      switch self {
      case .home: return "?json"
      case .bands: return "bands?_sort=name:DESC&_limit=500"
      case .gigs: return "gigs?_sort=from_date:DESC&_limit=500"
      case .band(let id):
        return "bands/\(id)/"
      }
    }
  }
  
  // MARK: - Vars

  static private let agent = Agent()
  static private let base = Constant.baseUrl
  
  // MARK: - Static funcs
  
  static func gigs() -> AnyPublisher<[GigModel], Error> {
    return screen(.gigs)
  }
  
  static func band(_ id: Int) -> AnyPublisher<BandModel, Error> {
    return screen(.band(id))
  }
  
  static func bands() -> AnyPublisher<[BandModel], Error> {
    return screen(.bands)
  }
  
  private static func screen<T: Decodable>(_ screen: Screen) -> AnyPublisher<T, Error> {
    let request = URLRequest(url: URL(string: base + screen.path)!)
    return run(request)
  }
  
  private static func run<T: Decodable>(_ request: URLRequest) -> AnyPublisher<T, Error> {
    return agent.run(request)
      .map(\.value)
      .eraseToAnyPublisher()
  }
  
}

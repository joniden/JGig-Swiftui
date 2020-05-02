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
  
  enum Screen: String {
    case home = "?json"
    case bands = "bands/all?json"
    case gigs = "gigs/all?json"
  }
  
  // MARK: - Vars

  static private let agent = Agent()
  static private let base = Constant.baseUrl
  
  // MARK: - Static funcs
  
  static func screen<T: Decodable>(_ screen: Screen) -> AnyPublisher<T, Error> {
    let request = URLRequest(url: URL(string: base + screen.rawValue)!)
    return run(request)
  }
  
  static func bands() -> AnyPublisher<BandsApiModel, Error> {
    return screen(.home)
  }

  static func run<T: Decodable>(_ request: URLRequest) -> AnyPublisher<T, Error> {
    return agent.run(request)
      .map(\.value)
      .eraseToAnyPublisher()
  }
  
}

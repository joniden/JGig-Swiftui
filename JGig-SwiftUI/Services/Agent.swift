//
//  Agent.swift
//  JGig-SwiftUI
//
//  Created by Joacim Nidén on 2020-05-01.
//  Copyright © 2020 Joacim Nidén. All rights reserved.
//

import Foundation
import Combine

struct Agent {

  struct Response<T> {
    let value: T
    let response: URLResponse
  }
    
  func run<T: Decodable>(_ request: URLRequest, _ decoder: JSONDecoder = JSONDecoder()) -> AnyPublisher<Response<T>, Error> {
    
    // Set cache
    let cacheSizeMegabytes = 30
    URLCache.shared = URLCache(
      memoryCapacity: cacheSizeMegabytes*1024*1024,
      diskCapacity: 0,
      diskPath: nil
    )
    
    var mutableRequest = request
    mutableRequest.cachePolicy = .returnCacheDataElseLoad
    
    return URLSession.shared
      .dataTaskPublisher(for: mutableRequest)
      .tryMap { result -> Response<T> in
        let value = try decoder.decode(T.self, from: result.data)
        return Response(value: value, response: result.response)
      }
      .receive(on: DispatchQueue.main)
      .eraseToAnyPublisher()
  }
}

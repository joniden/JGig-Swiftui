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
    return URLSession.shared
      .dataTaskPublisher(for: request)
      .tryMap { result -> Response<T> in
        let value = try decoder.decode(T.self, from: result.data)
        return Response(value: value, response: result.response)
      }
      .receive(on: DispatchQueue.main)
      .eraseToAnyPublisher()
  }
  
  private func emptyPublisher<T>(completeImmediately: Bool = true) -> AnyPublisher<T, Error> {
      Empty<T, Error>(completeImmediately: completeImmediately).eraseToAnyPublisher()
  }
}

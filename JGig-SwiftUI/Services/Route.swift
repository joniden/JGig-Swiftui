//
//  Route.swift
//  JGig-SwiftUI
//
//  Created by Joacim Nidén on 2020-04-29.
//  Copyright © 2020 Joacim Nidén. All rights reserved.
//

import Foundation
import Combine

class Route: ObservableObject {
  
  // MARK: - Enums
  
  enum Screen: String {
    case home = "?json"
    case bands = "bands/all?json"
    case gigs = "gigs/all?json"
  }
  
  // MARK: - Vars
  
  var cancellable : Set<AnyCancellable> = Set()

  // MARK: - Published vars
  
  @Published var home: HomeApiModel?
  
  // MARK: - Private vars
  
  private let baseUrl = Constant.baseUrl
  
  // MARK: - Life cycle
  
  init() {
    fetchHome()
  }
  
  // MARK: - Public methods
  
  func fetchHome() {
    URLSession.shared.dataTaskPublisher(for: URL(string: baseUrl + Screen.home.rawValue)!)
        .map { $0.data }
        .decode(type: HomeApiModel.self, decoder: JSONDecoder())
        .eraseToAnyPublisher()
        .receive(on: DispatchQueue.main)
       .sink(receiveCompletion: { completion in

    }) { post in
      self.home = post
    }
    .store(in: &cancellable)
  }
}

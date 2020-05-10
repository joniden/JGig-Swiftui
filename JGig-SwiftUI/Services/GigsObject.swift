//
//  Gigs.swift
//  JGig-SwiftUI
//
//  Created by Joacim Nidén on 2020-05-03.
//  Copyright © 2020 Joacim Nidén. All rights reserved.
//

import Foundation
import Combine

class GigsObject: ObservableObject {
  
  var gigs: [GigModel] = []
  var cancellationToken: AnyCancellable?
  
  init() {
    cancellationToken = JGigApi.gigs().mapError({ (error) -> Error in
      print(error)
      return error
    })
    .sink(receiveCompletion: { _ in }) { apiModel in
      self.gigs = apiModel.gigs
    }
  }
}

//
//  BandViewModel.swift
//  JGig-SwiftUI
//
//  Created by Joacim Nidén on 2020-05-02.
//  Copyright © 2020 Joacim Nidén. All rights reserved.
//

import Foundation
import Combine

class BandViewModel: ObservableObject {
  
  @Published var gigs: [GigModel] = [GigModel]()
  
  var cancellationToken: AnyCancellable?
  
  init(_ gigIds: [Int]) {
    cancellationToken = JGigApi.gigs().mapError({ (error) -> Error in
      print(error)
      return error
    })
    .sink(receiveCompletion: { _ in }) { model in
      self.gigs = model.gigs.filter({ gigIds.contains($0.id) })
    }
  }
  
}

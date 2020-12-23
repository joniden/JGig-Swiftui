//
//  BandsViewModel.swift
//  JGig-SwiftUI
//
//  Created by Joacim Nidén on 2020-05-02.
//  Copyright © 2020 Joacim Nidén. All rights reserved.
//

import Foundation
import Combine

class BandsViewModel: ObservableObject {
  
  @Published var sections = [BandSectionModel]()
  
  var cancellationToken: AnyCancellable?
  
  init() {
    cancellationToken = JGigApi.bands().mapError({ (error) -> Error in // 5
      print(error)
      return error
    })
    .sink(receiveCompletion: { _ in }) { apiModel in
      self.sections = apiModel.createAlphabeticalSection()
    }
  }
  
}

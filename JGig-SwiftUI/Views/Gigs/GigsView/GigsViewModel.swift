//
//  GigsViewModel.swift
//  JGig-SwiftUI
//
//  Created by Joacim Nidén on 2020-05-02.
//  Copyright © 2020 Joacim Nidén. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class GigsViewModel: ObservableObject {
  
  @Published var sections = [GigSectionModel]()
  
  var cancellationToken: AnyCancellable?
  
  init() {
    cancellationToken = JGigApi.gigs().mapError({ (error) -> Error in
      print(error)
      return error
    })
    .sink(receiveCompletion: { _ in }) { apiModel in
      self.sections = apiModel.gigs.createYearSection()
    }
  }
  
}

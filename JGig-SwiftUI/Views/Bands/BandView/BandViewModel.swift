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
  
  @Published var band: BandModel?
  
  var cancellationToken: AnyCancellable?
  
  init(_ bandId: Int) {
    cancellationToken = JGigApi.band(bandId).mapError({ (error) -> Error in
      print(bandId, error.localizedDescription)
      return error
    })
    .sink(receiveCompletion: { _ in }) { model in
      self.band = model.band
    }
  }
  
}

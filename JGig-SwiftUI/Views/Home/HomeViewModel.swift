//
//  HomeViewModel.swift
//  JGig-SwiftUI
//
//  Created by Joacim Nidén on 2020-05-01.
//  Copyright © 2020 Joacim Nidén. All rights reserved.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
  
  @Published var home: HomeApiModel?
  var cancellationToken: AnyCancellable?
  
  init() {
    cancellationToken = JGigApi.screen(.home)
		.mapError({ (error) -> Error in
			print(error)
			return error
		})
		.sink(receiveCompletion: { _ in }) { homeApiModel in
			self.home = homeApiModel
		}
  }
  
}

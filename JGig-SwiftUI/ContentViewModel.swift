//
//  ContentViewModel.swift
//  JGig-SwiftUI
//
//  Created by Joacim Nidén on 2020-12-23.
//  Copyright © 2020 Joacim Nidén. All rights reserved.
//

import Foundation
import Combine

class ContentViewModel: ObservableObject {
	@Published var bands: [BandModel] = []
	@Published var gigs: [GigModel] = []
	@Published var lastGig: HomeApiModel?
	
	var bandsCancellable: AnyCancellable?
	
	init() {
		
	}
}

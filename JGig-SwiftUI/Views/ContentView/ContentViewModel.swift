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
	@Published var bandSections: [BandSectionModel] = []
	@Published var gigs: [GigModel] = []
	@Published var home: HomeModel
	
	var bandsCancellable: AnyCancellable?
	var gigsCancellable: AnyCancellable?
	
	init() {
		
		home = HomeModel(gigs: 0, bands: [], lastgig: GigModel(), totalGigCount: 0, title: "Last gig")
		
		bandsCancellable = JGigApi.bands()
		.sink(receiveCompletion: { _ in }) { apiModel in
			self.bandSections = apiModel.createAlphabeticalSection()
			self.home.bands = apiModel
		}
		
		gigsCancellable = JGigApi.gigs()
		.sink(receiveCompletion: { _ in }) { apiModel in
			self.gigs = apiModel
			
			if let gig = apiModel.first {
				self.home.lastgig = gig
				self.home.title = gig.name
			}
			
			self.home.gigs = apiModel.count			
		}
	}
	
	
	/// Gigs contains more information, like venue info. So we need to remap
	/// - Parameter band: The band that has the gigs
	/// - Returns: Gigs with more information
	func gigs(band: BandModel) -> [GigModel] {
		let gigIds = band.gigs?.compactMap { $0.id } ?? []
		return gigs.filter { gigIds.contains($0.id)  }
	}
	
	func gigCount(band: BandModel) -> Int{
		return home.bands.first(where: { $0.id == band.id })?.gigs?.count ?? 0
	}
}

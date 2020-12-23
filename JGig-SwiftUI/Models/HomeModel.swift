//
//  HomeApiModel.swift
//  JGig
//
//  Created by Joacim Nidén on 2020-04-18.
//  Copyright © 2020 Joacim Nidén. All rights reserved.
//

import Foundation

struct HomeModel: Codable {
	var gigs: Int
	var bands: [BandModel]
	var lastgig: GigModel
	var totalGigCount: Int
	var title: String
	
	enum CodingKeys: String, CodingKey {
		case gigs, bands, lastgig, title
		case totalGigCount = "total_gig_count"
	}
}

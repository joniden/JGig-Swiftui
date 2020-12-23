//
//  BandGigModel.swift
//  JGig-SwiftUI
//
//  Created by Joacim Nidén on 2020-12-23.
//  Copyright © 2020 Joacim Nidén. All rights reserved.
//

import Foundation

// MARK: - Gig
struct BandGigModel: Codable, Identifiable {
  
  let id: Int
  let name: String
  let fromDate, endDate: String?
  let type: GigType
  let bands: [BandModel]?
  let venue: Int?
  let images: [ImageModel]?
  
  let year: String? // Not from API
  
  enum CodingKeys: String, CodingKey {
	case id, name, type, bands
	case images = "gig_images"
	case venue = "venue_id"
	case fromDate = "from_date"
	case endDate = "end_date"
  }
  
  init() {
	id = 0
	name = "default"
	fromDate = nil
	endDate = nil
	type = .concert
	bands = nil
	venue = nil
	images = nil
	year = nil
  }
  
  init(from decoder: Decoder) throws {
	let values = try decoder.container(keyedBy: CodingKeys.self)
	id = try values.decode(Int.self, forKey: .id)
	name = try values.decode(String.self, forKey: .name)
	type = try values.decode(GigType.self, forKey: .type)
	bands = try values.decodeIfPresent([BandModel].self, forKey: .bands)
	venue = try values.decodeIfPresent(Int.self, forKey: .venue)
	images = try values.decodeIfPresent([ImageModel].self, forKey: .images)
	
	// Format the dates
	let fromDateString = try values.decodeIfPresent(String.self, forKey: .fromDate)
	let endDateString = try values.decodeIfPresent(String.self, forKey: .endDate)
	
	fromDate = fromDateString.getFormattedDateString()
	endDate = endDateString.getFormattedDateString()
	
	year = fromDate.getYearFromString()
	
  }
  
}

extension BandGigModel: Hashable {
  static func == (lhs: BandGigModel, rhs: BandGigModel) -> Bool {
	return rhs.id == lhs.id
  }
}

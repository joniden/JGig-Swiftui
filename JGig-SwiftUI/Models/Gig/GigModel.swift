//
//  GigModel.swift
//  JGig
//
//  Created by Joacim Nidén on 2020-04-19.
//  Copyright © 2020 Joacim Nidén. All rights reserved.
//

import Foundation

// MARK: - Gig
struct GigModel: Codable, Identifiable {
  
  let id: Int
  let name: String
  let fromDate, endDate: String?
  let type: GigType
  let bands: [BandModel]?
  let venue: VenueModel?
  let images: [ImageModel]?
  
  let year: String? // Not from API
  
  enum CodingKeys: String, CodingKey {
    case id, name, type, bands, venue, images
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
    venue = try values.decodeIfPresent(VenueModel.self, forKey: .venue)
    images = try values.decodeIfPresent([ImageModel].self, forKey: .images)
    
    // Format the dates
    let fromDateString = try values.decodeIfPresent(String.self, forKey: .fromDate)
    let endDateString = try values.decodeIfPresent(String.self, forKey: .endDate)
    
    fromDate = fromDateString.getFormattedDateString()
    endDate = endDateString.getFormattedDateString()
    
    year = fromDate.getYearFromString()
    
  }
  
}

extension GigModel: Hashable {
  static func == (lhs: GigModel, rhs: GigModel) -> Bool {
    return rhs.id == lhs.id
  }
}

extension Array where Element == GigModel {
  
  /// Searches the Gigs
  /// - Parameter string: search string
  /// - Returns: BandSectionModels
  func search(_ string: String) -> [GigSectionModel] {
    return self.filter {
      $0.name.lowercaseContains(string)
    }.createYearSection()
  }
  
  /// Groups gigmodel by the year and sorts the array by year
  /// - Returns: GigSectionModels
  func createYearSection() -> [GigSectionModel] {
    
    let dict = Dictionary(grouping: self) { $0.year }
    
    return dict.map {
      GigSectionModel(year: "\($0.key ?? "")", rows: $0.value.sorted(by: { $0.fromDate ?? "" > $1.fromDate ?? "" }))
    }.sorted(by: { (Int($0.year) ?? 0) > (Int($1.year) ?? 0) })
  }
}

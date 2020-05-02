//
//  VenueModel.swift
//  JGig
//
//  Created by Joacim Nidén on 2020-04-19.
//  Copyright © 2020 Joacim Nidén. All rights reserved.
//

import Foundation

struct VenueModel: Codable {
    let id: Int
    let name: String
    let address, city, country: String?
}

extension VenueModel: Hashable { }

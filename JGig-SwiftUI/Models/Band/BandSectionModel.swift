//
//  BandSectionModel.swift
//  JGig
//
//  Created by Joacim Nidén on 2020-04-26.
//  Copyright © 2020 Joacim Nidén. All rights reserved.
//

import Foundation

struct BandSectionModel {
  let letter: String
  let rows: [BandModel]
}

extension Array where Element == BandSectionModel {
  
  func search(_ string: String) -> [BandSectionModel] {
    
    guard string.count > 0 else {
      return self
    }
    
    let allBands = self.flatMap { $0.rows }
    return allBands.search(string)
  }
  
}

//
//  GigSectionModel.swift
//  JGig-SwiftUI
//
//  Created by Joacim Nidén on 2020-05-02.
//  Copyright © 2020 Joacim Nidén. All rights reserved.
//

import Foundation

struct GigSectionModel {
  let year: String
  let rows: [GigModel]
}


extension Array where Element == GigSectionModel {
  
  func search(_ string: String) -> [GigSectionModel] {
    
    guard string.count > 0 else {
      return self
    }
    
    let all = self.flatMap { $0.rows }
    return all.search(string)
  }
  
}

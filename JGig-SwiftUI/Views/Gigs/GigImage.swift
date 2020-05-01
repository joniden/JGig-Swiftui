//
//  GigImage.swift
//  JGig-SwiftUI
//
//  Created by Joacim Nidén on 2020-04-29.
//  Copyright © 2020 Joacim Nidén. All rights reserved.
//

import SwiftUI
import KingfisherSwiftUI

struct GigImage: View {
  
  private var path: String?
  
  init(_ urlPath: String?) {
    self.path = urlPath
  }
  
  var body: some View {
    self.path.map {
      
      KFImage(URL(string: String($0)))
        .resizable()
        .scaledToFill()
        .frame(maxWidth: .infinity, maxHeight: 214)
        .clipped()
   }
  }
}


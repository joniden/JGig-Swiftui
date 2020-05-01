//
//  BandTags.swift
//  JGig-SwiftUI
//
//  Created by Joacim Nidén on 2020-04-29.
//  Copyright © 2020 Joacim Nidén. All rights reserved.
//

import SwiftUI

struct BandTags: View {
  private var bands: [BandModel]
  private let colors: [Color] = [.blue, .red, .green, .yellow, .purple, .pink]
  
  init(_ bands: [BandModel]?) {
    self.bands = bands ?? []
  }
  
  var body: some View {
    
    ScrollView(.horizontal) {
      HStack(alignment: .center) {
        ForEach(Array(bands.enumerated()), id: \.offset) { index, band in
          Text(band.name)
            .padding(.horizontal)
            .background(self.colors[index])
            .cornerRadius(6)
        }
      }
    }.padding(.vertical, 8.0)
  }
}

struct BandTags_Previews: PreviewProvider {
    static var previews: some View {
      BandTags(nil)
    }
}

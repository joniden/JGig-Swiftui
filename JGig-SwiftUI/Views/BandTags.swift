//
//  BandTags.swift
//  JGig-SwiftUI
//
//  Created by Joacim Nidén on 2020-04-29.
//  Copyright © 2020 Joacim Nidén. All rights reserved.
//

import SwiftUI

struct BandTags: View {
  let bands = ["Band 1", "Band 2", "Band 3", "Band 4", "Band 5", "Band 6"]
  
  let colors: [Color] = [.blue, .red, .green, .yellow, .purple, .pink]
  
  var body: some View {
    ScrollView(.horizontal) {
      HStack(alignment: .center) {
        ForEach(Array(bands.enumerated()), id: \.element) { index, band in
          Text(band)
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
        BandTags()
    }
}

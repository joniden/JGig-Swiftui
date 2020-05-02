//
//  GigRow.swift
//  JGig-SwiftUI
//
//  Created by Joacim Nidén on 2020-05-02.
//  Copyright © 2020 Joacim Nidén. All rights reserved.
//

import SwiftUI

struct GigRow: View {
  
  var gig: GigModel
  
  var body: some View {
    VStack(alignment: .leading, spacing: 8.0) {
      Text(gig.name)
        .frame(maxWidth: .infinity, alignment: .leading)
        .multilineTextAlignment(.leading)
        .font(.system(size: 17, weight: .bold))
      Text(gig.venue?.name ?? "")
        .multilineTextAlignment(.leading)

      BandTags(gig.bands)
    }
    .frame(height: 112.0)
  }
}

struct GigRow_Previews: PreviewProvider {
  static var previews: some View {
    GigRow(gig: GigModel())
  }
}

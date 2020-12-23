//
//  BandView.swift
//  JGig-SwiftUI
//
//  Created by Joacim Nidén on 2020-05-02.
//  Copyright © 2020 Joacim Nidén. All rights reserved.
//

import SwiftUI

struct BandView: View {
  
  init(_ band: BandModel) {
    self.band = band
  }
  
  // Band comes from parent model
  var band: BandModel
  
  // The model contains the gigs and the bands related to that gig
  @EnvironmentObject var viewModel: ContentViewModel
  
  var body: some View {
    List {
		ForEach(viewModel.gigs(band: band), id: \.id) { gig in
         GigRow(gig: gig)
       }
    }
    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)      
    .navigationBarTitle(band.name)
  }
}

struct BandView_Previews: PreviewProvider {
    static var previews: some View {
        BandView(BandModel(id: 0, name: "dfdfdf", gigs: nil))
    }
}

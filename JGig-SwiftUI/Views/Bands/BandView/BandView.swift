//
//  BandView.swift
//  JGig-SwiftUI
//
//  Created by Joacim Nidén on 2020-05-02.
//  Copyright © 2020 Joacim Nidén. All rights reserved.
//

import SwiftUI

struct BandView: View {
  
  init(_ id: Int) {
    model = BandViewModel(id)
  }
  
  @ObservedObject var model: BandViewModel

  var body: some View {
    List {
      model.band?.gigs.map { gigs in
        ForEach(gigs, id: \.id) { gig  in
           GigRow(gig: gig)
         }
      }
    }
    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)      
    .navigationBarTitle(model.band?.name ?? "")
  }
}

struct BandView_Previews: PreviewProvider {
    static var previews: some View {
        BandView(0)
    }
}

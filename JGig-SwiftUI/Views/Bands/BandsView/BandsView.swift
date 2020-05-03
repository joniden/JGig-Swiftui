//
//  BandsView.swift
//  JGig-SwiftUI
//
//  Created by Joacim Nidén on 2020-04-29.
//  Copyright © 2020 Joacim Nidén. All rights reserved.
//

import SwiftUI

struct BandsView: View {
  
  @ObservedObject var model: BandsViewModel = BandsViewModel()
  
  var body: some View {
    NavigationView {
      List {
        ForEach(model.sections, id: \.letter) { section in
          Section(header: Text(section.letter)) {
            ForEach(section.rows, id: \.id) { band in
              NavigationLink(destination: BandView(band)) {
                BandRow(band: band)
              }
            }
          }
        }
      }
      .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
      .navigationBarTitle("Bands")
    }
  }
}

struct BandsView_Previews: PreviewProvider {
    static var previews: some View {
        BandsView()
    }
}

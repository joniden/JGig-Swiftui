//
//  BandsView.swift
//  JGig-SwiftUI
//
//  Created by Joacim Nidén on 2020-04-29.
//  Copyright © 2020 Joacim Nidén. All rights reserved.
//

import SwiftUI

struct BandsView: View {
  
  var bands: [String] = ["A day to remember",
                         "Architects",
                         "The Ark",
                         "As I Lay Dying"]
  
  var body: some View {
    NavigationView {
      List {
        Section(header: Text("A")) {
          ForEach(Array(bands.enumerated()), id: \.element) { index, band in
            HStack(alignment: .center, spacing: 16.0) {
              Image("placeholder")
              Text(band)
                .frame(maxWidth: .infinity, alignment: .leading)
                .multilineTextAlignment(.leading)
                .font(.system(size: 17, weight: .bold))
              Text("3")
                .multilineTextAlignment(.trailing)
                .frame(width: 10.0)
            }
            .frame(height: 60.0)
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

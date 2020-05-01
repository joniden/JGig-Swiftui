//
//  GigsView.swift
//  JGig-SwiftUI
//
//  Created by Joacim Nidén on 2020-04-29.
//  Copyright © 2020 Joacim Nidén. All rights reserved.
//

import SwiftUI

struct GigsView: View {
  var gigs: [String] = ["A day to remember",
                         "Architects",
                         "The Ark",
                         "As I Lay Dying"]
  
  var body: some View {
    NavigationView {
      List {
        Section(header: Text("2020")) {
          ForEach(Array(gigs.enumerated()), id: \.element) { index, gig in
            VStack(alignment: .leading, spacing: 8.0) {
              Text(gig)
                .frame(maxWidth: .infinity, alignment: .leading)
                .multilineTextAlignment(.leading)
                .font(.system(size: 17, weight: .bold))
              Text("Klubben, Februari 2020")
                .multilineTextAlignment(.leading)

              BandTags(nil)
            }
            .frame(height: 112.0)
          }
        }
      }
      .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
         
      .navigationBarTitle("Gigs")
    }
  }
}

struct GigsView_Previews: PreviewProvider {
    static var previews: some View {
        GigsView()
    }
}

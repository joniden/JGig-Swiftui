//
//  GigsView.swift
//  JGig-SwiftUI
//
//  Created by Joacim Nidén on 2020-04-29.
//  Copyright © 2020 Joacim Nidén. All rights reserved.
//

import SwiftUI

struct GigsView: View {
  
  @ObservedObject var model: GigsViewModel = GigsViewModel()
  
  var body: some View {
    NavigationView {
      List {
        ForEach(model.sections, id: \.year) { section in
          Section(header: Text(section.year)) {
            ForEach(section.rows, id: \.id) { gig in
              GigRow(gig: gig)
            }
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

//
//  GigsView.swift
//  JGig-SwiftUI
//
//  Created by Joacim Nidén on 2020-04-29.
//  Copyright © 2020 Joacim Nidén. All rights reserved.
//

import SwiftUI

struct GigsView: View {
  
  @EnvironmentObject var model: GigsObject
  
  @State private var searchText = ""
  
  var sections: [GigSectionModel] {
    return model.gigs.createYearSection()
  }
  
  var body: some View {
    NavigationView {
      VStack {
        SearchBar(text: $searchText)
        List {
          ForEach(sections.search(searchText), id: \.year) { section in
            Section(header: Text("\(section.year) (\(section.rows.count) gigs)")) {
              ForEach(section.rows, id: \.id) { gig in
                NavigationLink(destination: GigView(gig: gig)) {
                  GigRow(gig: gig)
                }
              }
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

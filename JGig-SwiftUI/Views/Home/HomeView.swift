//
//  HomeView.swift
//  JGig-SwiftUI
//
//  Created by Joacim Nidén on 2020-04-29.
//  Copyright © 2020 Joacim Nidén. All rights reserved.
//

import SwiftUI

struct HomeView: View {
  var body: some View {
    NavigationView {
      VStack(alignment: .leading) {
        Image("default_gig")
          .resizable()
          .scaledToFit()
        Text("BandName")
          .font(.system(size: 28))
          .bold()
          .padding(.horizontal)
        Text("Location, Date")
          .foregroundColor(.secondary)
          .padding(.horizontal)
        BandTags()
        HomeStats().padding()
      }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
      
      .navigationBarTitle("Latest Gig")
    }
  }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

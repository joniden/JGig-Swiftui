//
//  HomeView.swift
//  JGig-SwiftUI
//
//  Created by Joacim Nidén on 2020-04-29.
//  Copyright © 2020 Joacim Nidén. All rights reserved.
//

import SwiftUI
import KingfisherSwiftUI

struct HomeView: View {
  
  //var model = HomeApiModel(gigs: 0, bands: [], lastgig: GigModel(), totalGigCount: 0, title: "Latest Gig")
  
  @ObservedObject var model: HomeViewModel = HomeViewModel()
  
  var body: some View {
    
    NavigationView {
      VStack(alignment: .leading) {
        GigImage(model.home?.lastgig.images?.first?.path)
        Text(model.home?.lastgig.name ?? "")
          .font(.system(size: 28))
          .bold()
          .padding(.horizontal)
        Text(model.home?.lastgig.fromDate ?? "")
          .foregroundColor(.secondary)
          .padding(.horizontal)
        BandTags(model.home?.lastgig.bands).padding(.horizontal)
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

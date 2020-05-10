//
//  GigView.swift
//  JGig-SwiftUI
//
//  Created by Joacim Nidén on 2020-05-10.
//  Copyright © 2020 Joacim Nidén. All rights reserved.
//

import SwiftUI

struct GigView: View {
  
  var gig: GigModel
  
  var body: some View {
    NavigationView {
      VStack(alignment: .leading) {
        
        GigImage(gig.images?.first?.path)
        Text(gig.venue?.name ?? "")
          .bold()
          .padding(.horizontal)
       Text(gig.fromDate ?? "")
          .foregroundColor(.secondary)
          .padding(.horizontal)
                
        gig.bands.map({ bands in
          
          List {
            Text("\(bands.count) bands")
            ForEach(bands, id: \.id) { band in
              BandRow(band: band)
            }
          }
        })
              
      }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
      
        .navigationBarTitle(gig.name)
    }
  }
}

struct GigView_Previews: PreviewProvider {
  static var previews: some View {
    GigView(gig: GigModel())
  }
}

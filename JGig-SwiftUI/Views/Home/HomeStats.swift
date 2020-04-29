//
//  HomeStats.swift
//  JGig-SwiftUI
//
//  Created by Joacim Nidén on 2020-04-29.
//  Copyright © 2020 Joacim Nidén. All rights reserved.
//

import SwiftUI

struct HomeStats: View {
  var body: some View {
    VStack(alignment: .center, spacing: 16.0) {
      Text("Stats")
        .font(.system(size: 28))
        .bold()
        .foregroundColor(.white)
        .multilineTextAlignment(.center)
        .frame(maxWidth: .infinity)
      
      HStack(alignment: .center) {
        Cell(digit: 1, header: "Bands")
        Cell(digit: 2, header: "Gigs")
        Cell(digit: 3, header: "On Stage")
      }.frame(maxWidth: .infinity)
      
    }.frame(maxWidth: .infinity)
      .padding(.all)
      .background(Color.secondaryBackground)
      .cornerRadius(20)
  }
  
  struct Cell: View {
    
    @State var digit: Int
    @State var header: String
    
    var body: some View {
      VStack {
        Text("\(digit)")
          .font(.system(size: 28))
          .bold()
          .foregroundColor(.white)
        Text(header)
          .font(.system(.subheadline))
          .foregroundColor(.subTitle)
      }.frame(maxWidth: .infinity)
    }
  }
}

struct HomeStats_Previews: PreviewProvider {
    static var previews: some View {
        HomeStats()
    }
}

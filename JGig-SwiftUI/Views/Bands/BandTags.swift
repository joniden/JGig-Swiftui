//
//  BandTags.swift
//  JGig-SwiftUI
//
//  Created by Joacim Nidén on 2020-04-29.
//  Copyright © 2020 Joacim Nidén. All rights reserved.
//

import SwiftUI

struct BandTags: View {
  
  private var bands: [BandModel]
  private let colors: [Color] = [.gigBlue, .gigRed, .gigGreen, .gigYellow, .gigPurple, .gigPink].shuffled()
  private let maxSize = 2
  private var extraBands = 0
  
  init(_ bands: [BandModel]?) {
    if let bands = bands, bands.count > maxSize {
      self.extraBands = bands.count - maxSize
      self.bands = Array(bands.prefix(maxSize))
    } else {
      self.bands = bands ?? []
    }
  }
  
  var body: some View {
    
    ScrollView(.horizontal) {
      HStack(alignment: .center) {
        ForEach(Array(bands.enumerated()), id: \.offset) { index, band in
          self.bandTag(value: band.name, index: index)
        }
        
        if extraBands > 0 {
          self.showExtraBands()
        }
      }
    }.padding(.vertical, 8.0)
  }
  
  func bandTag(value: String, index: Int) -> some View {
    Text(value)
     .padding(EdgeInsets(top: 4, leading: 8, bottom: 4, trailing: 8))
     .foregroundColor(.white)
     .background(self.colors[index])
     .font(.system(size: 13, weight: .semibold))
     .cornerRadius(6)
  }
  
  func showExtraBands() -> some View {
    bandTag(value: "+\(extraBands)", index: Int.random(in: 0..<colors.count))
  }
  
}

struct BandTags_Previews: PreviewProvider {
    static var previews: some View {
      BandTags(nil)
    }
}

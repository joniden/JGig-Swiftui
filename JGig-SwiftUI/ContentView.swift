//
//  ContentView.swift
//  JGig-SwiftUI
//
//  Created by Joacim Nidén on 2020-04-29.
//  Copyright © 2020 Joacim Nidén. All rights reserved.
//

import SwiftUI

struct ContentView: View {
		
	@EnvironmentObject var bands: [BandModel]
	@EnvironmentObject var gigs: [GigModel]
  
  var body: some View {
    TabView {
      HomeView()
        .tabItem {
          Image(systemName: "music.house")
          Text("Home")
      }
      
      BandsView()
        .tabItem {
          Image(systemName: "music.mic")
          Text("Bands")
        }
      
      GigsView()
        .tabItem {
          Image(systemName: "music.note.list")
          Text("Gigs")
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

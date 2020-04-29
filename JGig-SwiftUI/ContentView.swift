//
//  ContentView.swift
//  JGig-SwiftUI
//
//  Created by Joacim Nidén on 2020-04-29.
//  Copyright © 2020 Joacim Nidén. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  
  var body: some View {
    TabView {
      HomeView()
        .tabItem {
          Image(systemName: "music.house")
          Text("Home")
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

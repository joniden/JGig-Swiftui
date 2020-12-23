//
//  BandsView.swift
//  JGig-SwiftUI
//
//  Created by Joacim Nidén on 2020-04-29.
//  Copyright © 2020 Joacim Nidén. All rights reserved.
//

import SwiftUI

struct BandsView: View {
	
	@EnvironmentObject var viewModel: ContentViewModel
	
	@State private var searchText = ""
	
	var body: some View {
		NavigationView {
			VStack {
				SearchBar(text: $searchText)
				List {
					ForEach(viewModel.bandSections.search(searchText), id: \.letter) { section in
						Section(header: Text(section.letter)) {
							ForEach(section.rows, id: \.id) { band in
								NavigationLink(destination: BandView(band)) {
									BandRow(band: band)
								}
							}
						}
					}
				}
			}
			.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
			.navigationBarTitle("Bands")
		}
	}
}

struct BandsView_Previews: PreviewProvider {
	static var previews: some View {
		BandsView()
	}
}

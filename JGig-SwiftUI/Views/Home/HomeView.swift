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
	
	@EnvironmentObject var viewModel: ContentViewModel
	
	private var home: HomeModel {
		return viewModel.home
	}
	
	var body: some View {
		
		NavigationView {
			VStack(alignment: .leading) {
				GigImage(home.lastgig.images?.first?.path)
				Text(home.lastgig.name)
					.font(.system(size: 28))
					.bold()
					.padding(.horizontal)
				Text(home.lastgig.fromDate ?? "")
					.foregroundColor(.secondary)
					.padding(.horizontal)
				BandTags(home.lastgig.bands).padding(.horizontal)
				HomeStats(gigs: home.gigs,
						  totalGigCount: home.totalGigCount,
						  bandsCount: home.bands.count)
					.padding()
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

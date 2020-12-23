//
//  BandRow.swift
//  JGig-SwiftUI
//
//  Created by Joacim Nidén on 2020-05-02.
//  Copyright © 2020 Joacim Nidén. All rights reserved.
//

import Foundation
import SwiftUI
import KingfisherSwiftUI

struct BandRow: View {
	
	@EnvironmentObject var viewModel: ContentViewModel
	
	var band: BandModel
	
	var count: Int {
		if let count = band.gigs?.count, count > 0 {
			return count
		} else {
			return viewModel.gigCount(band: band)
		}
	}
	
	var body: some View {
		HStack(alignment: .center, spacing: 16.0) {
			Image("placeholder")
			Text(band.name)
				.frame(maxWidth: .infinity, alignment: .leading)
				.multilineTextAlignment(.leading)
				.font(.system(size: 17, weight: .bold))
			Text("\(count)")
				.multilineTextAlignment(.trailing)
				.frame(width: 20.0)
			
		}
		.frame(height: 60.0)
	}
}

struct BandRow_Previews: PreviewProvider {
	static var previews: some View {
		BandRow(band: BandModel(id: 0,
								name: "test band",
								gigs: nil))
	}
}

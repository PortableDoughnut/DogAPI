//
//  DogListView.swift
//  DogAPI
//
//  Created by Gwen Thelin on 1/28/25.
//

import SwiftUI

struct DogListView: View {
	@ObservedObject var viewModel: DogViewModel
	var index: Int
	
    var body: some View {
		VStack {
			DogImageView(viewModel: viewModel, index: index)
			Text(viewModel.dogs[index].name)
		}
    }
}

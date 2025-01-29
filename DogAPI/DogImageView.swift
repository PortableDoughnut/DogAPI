//
//  DogView.swift
//  DogAPI
//
//  Created by Gwen Thelin on 1/28/25.
//

import SwiftUI

struct DogImageView: View {
	var viewModel: DogViewModel
	var index: Int
	
	var body: some View {
			AsyncImage(
				url: viewModel.dogs[index].message,
				content: {
					image in
					image.resizable()
						.aspectRatio(contentMode: .fit)
						.frame(width: 300, height: 300)
				},
				placeholder: {
					ProgressView()
				}
			)
			.cornerRadius(8)
		}
	}

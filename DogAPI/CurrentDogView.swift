//
//  CurrentDogView.swift
//  DogAPI
//
//  Created by Gwen Thelin on 1/28/25.
//

import SwiftUI

struct CurrentDogView: View {
	@ObservedObject var viewModel: DogViewModel
	var index: Int
	
	@State private var nameInput: String = ""
	@State private var shownName: String?
	
	
    var body: some View {
		VStack {
			DogImageView(viewModel: viewModel, index: index)
			Text(shownName ?? "Loading...")
			
			HStack {
				TextField("Name for this dog", text: $nameInput)
					.textFieldStyle(.roundedBorder)
				
				Button("Set Name") {
					viewModel.dogs[index].name = nameInput
					shownName = nameInput
				}
			}
			.padding()
		}
		.onAppear() {
			shownName = viewModel.dogs[index].name
		}
		.onChange(of: index) {
			newIndex in
			shownName = viewModel.dogs[newIndex].name
			nameInput = ""
		}
    }
}

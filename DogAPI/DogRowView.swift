//
//  DogRowView.swift
//  DogAPI
//
//  Created by Gwen Thelin on 1/29/25.
//

import Foundation
import SwiftUI

struct DogRowView: View {
	@State private var isTapped: Bool = false
	@ObservedObject var viewModel: DogViewModel
	let index: Int
	
	
	
	var body: some View {
		
		if !isTapped {
			DogListView(viewModel: viewModel, index: index)
				.onTapGesture { isTapped = true }
		} else {
			CurrentDogView(viewModel: viewModel, index: index)
				.onChange(of: viewModel.dogs[index].name) {
					_ in
					isTapped = false
				}
		}
	}
}

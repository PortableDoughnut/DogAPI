//
//  ContentView.swift
//  DogAPI
//
//  Created by Gwen Thelin on 1/27/25.
//

import SwiftUI

struct ContentView: View {
	@StateObject private var viewModel: DogViewModel = .init()
	
    var body: some View {
        VStack {
			if let errorMessage = viewModel.errorMessage {
				Text("Error: \(errorMessage)")
			} else if let dog = viewModel.dog {
				AsyncImage(
					url: dog.message,
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
			}
			
			Button("Get Dog") {
				viewModel.fetchDog()
			}
			.buttonStyle(.borderedProminent)
        }
		.onAppear {
			viewModel.fetchDog()
		}
        .padding()
    }
}

#Preview {
    ContentView()
}

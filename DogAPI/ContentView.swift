//
//  ContentView.swift
//  DogAPI
//
//  Created by Gwen Thelin on 1/27/25.
//

import SwiftUI

struct ContentView: View {
	@StateObject private var viewModel: DogViewModel = .init()
	
	@State private var getDogButtonPressed: Bool = false

	
	var body: some View {
		Form {
				if viewModel.dogs.count > 0 {
					List(viewModel.dogs, id: \.id) {
						dog in
						@State var isTapped: Bool = false
						
						let currentIndex: Int = viewModel.dogs.firstIndex(where: { $0.id ==  dog.id})!
						
						if currentIndex != viewModel.dogs.count - 1 {
							DogRowView(viewModel: viewModel, index: currentIndex)
						}
					}
					
					CurrentDogView(viewModel: viewModel, index: viewModel.dogs.count - 1)
				}
				
				Button("Get Dog") {
					viewModel.fetchDog()
					
					withAnimation(.easeInOut(duration: 0.1)) {
						getDogButtonPressed = true
					}
					DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
						withAnimation(.easeInOut(duration: 0.1)) {
							getDogButtonPressed = false
						}
					}
				}
				.buttonStyle(.borderedProminent)
				.scaleEffect(getDogButtonPressed ? 0.9 : 1.0)
			}
		.cornerRadius(12)
			.onAppear {
				viewModel.fetchDog()
			}
			.padding()
		}
	}

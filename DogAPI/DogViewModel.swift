//
//  DogViewModel.swift
//  DogAPI
//
//  Created by Gwen Thelin on 1/27/25.
//

import Foundation

class DogViewModel: ObservableObject {
	enum fetchDogError: Error {
		case invalidURL
		case networkError
		case decodingError
		case dataError
		case unknown
	}
	
	@Published var dog: Dog?
	@Published var errorMessage: String?
	
	func fetchDog() {
		let urlString: String = "https://dog.ceo/api/breeds/image/random"
		
		guard let url: URL = .init(string: urlString) else {
			errorMessage = fetchDogError.invalidURL.localizedDescription
			return
		}
		
		URLSession.shared.dataTask(with: url) {
			[weak self] data, response, error in
			DispatchQueue.main.async {
				if let error = error {
					self?.errorMessage = fetchDogError.networkError.localizedDescription
					return
				}
				
				guard let data = data else {
					self?.errorMessage = fetchDogError.dataError.localizedDescription
					return
				}
				
				do {
					let dog = try JSONDecoder().decode(Dog.self, from: data)
					self?.dog = dog
					self?.errorMessage = nil
				} catch {
					self?.errorMessage = fetchDogError.decodingError.localizedDescription
				}
			}
		}.resume()
	}
}

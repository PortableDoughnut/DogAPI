//
//  Dog.swift
//  DogAPI
//
//  Created by Gwen Thelin on 1/27/25.
//

import Foundation

struct Dog: Codable, Identifiable {
	var id: UUID = .init()
	var message: URL
	var status: Bool
	
	enum CodingKeys: String, CodingKey {
		case message
		case status
	}
	
	init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		message = try container.decode(URL.self, forKey: .message)
		let statusString = try container.decode(String.self, forKey: .status)
		status = statusString == "success"
	}
	
	init(id: UUID = .init(), message: URL, status: Bool) {
		self.id = id
		self.message = message
		self.status = status
	}
	
	func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(message, forKey: .message)
		try container.encode(status ? "success" : "failure", forKey: .status)
	}
}

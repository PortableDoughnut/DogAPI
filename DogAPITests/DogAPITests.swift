//
//  DogAPITests.swift
//  DogAPITests
//
//  Created by Gwen Thelin on 1/27/25.
//

import XCTest
@testable import DogAPI

final class DogAPITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
	
	func testDogModel() throws {
			// Create a sample Dog instance with valid data
		let dog = Dog(
			message: URL(string: "https://images.dog.ceo/breeds/springer-english/n02102040_4295.jpg")!,
			status: true
		)
		
		XCTAssertNotNil(dog.id, "Dog id should not be nil")
		XCTAssertFalse(dog.id.uuidString.isEmpty, "Dog id should have a valid UUID string")
		
		XCTAssertEqual(dog.message, URL(string: "https://images.dog.ceo/breeds/springer-english/n02102040_4295.jpg"), "Dog message URL should match the initialized value")
		
		XCTAssertTrue(dog.status, "Dog status should be true as initialized")
	}
	
	func testDogDecodeJSON() throws {
		let data =
"""
{
	"message": "https://images.dog.ceo/breeds/springer-english/n02102040_4295.jpg",
	"status": "success"
}
""".data(using: .utf8)
		
		let decoder: JSONDecoder = .init()
		let dog = try decoder.decode(Dog.self, from: data!)
		
		XCTAssertEqual(
			dog.message,
					   URL(
						string: 
							"https://images.dog.ceo/breeds/springer-english/n02102040_4295.jpg"
					   )
		)
		XCTAssertTrue(dog.status)
	}
	}


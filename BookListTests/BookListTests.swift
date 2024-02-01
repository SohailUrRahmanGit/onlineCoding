//
//  BookListTests.swift
//  BookListTests
//
//  Created by Sohail on 2024-02-01.
//

import XCTest
@testable import BookList

// Mock implementation of the networking service for testing purposes
class MockNetworkingService: NetworkingServiceProtocol {
    var shouldSucceed = true
    
    // Simulate fetching books asynchronously
    func fetchBooks() async throws -> [Book] {
        if shouldSucceed {
            return [Book(name: "A Game of Thrones", numberOfPages: 694, released: "1996-08-01T00:00:00")]
        } else {
            throw NetworkError.fetchFailed
        }
    }
}


// Unit tests for the BookList app
final class BookListTests: XCTestCase {

    var mockNetworkingService: MockNetworkingService!
    var viewModel: BooksViewModel!
    
    override func setUpWithError() throws {
        mockNetworkingService = MockNetworkingService()
        viewModel = BooksViewModel(networkingService: mockNetworkingService)
    }
    
    // Test fetching books successfully
    func testFetchBooksSuccess() async {
        
        await viewModel.fetchBooks()
        
        XCTAssertEqual(viewModel.books.count, 1)
        XCTAssertEqual(viewModel.books.first?.name, "A Game of Thrones")
    }

    // Test fetching books failure
    func testFetchBookFailure() async {
        mockNetworkingService.shouldSucceed = false
        
        await viewModel.fetchBooks()
        
        XCTAssertTrue(viewModel.books.isEmpty, "Expected empty Books array")
    }
    
    override func tearDown() async throws {
        mockNetworkingService = nil
        viewModel = nil
    }
}

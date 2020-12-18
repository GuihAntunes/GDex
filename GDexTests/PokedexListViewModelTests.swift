//
//  PokedexListViewModelTests.swift
//  GDexTests
//
//  Created by Guilherme Antunes Ferreira on 18/12/2020.
//  Copyright © 2020 Guihsoft. All rights reserved.
//

import XCTest
@testable import GDex

class PokedexListViewModelTests: XCTestCase {

    class MockedView: PokedexListPresentable {

        var reloadListCalled = false
        var showErrorCalled = false
        
        func reloadList() {
            reloadListCalled = true
        }
        
        func displayError(withTitle title: String, andMessage message: String) {
            showErrorCalled = true
        }
           
           
    }
    
    class MockedCoordinator: AppCoordinatorProtocol {

        var presentNextStepCalled = false
        var presentPreviousStepCalled = false
        var selectedModel: Codable?
        
        func presentNextStep<T>(withModel model: T?) where T : Decodable, T : Encodable {
            selectedModel = model
            presentNextStepCalled = true
        }
        
        func presentPreviousStep() {
            presentPreviousStepCalled = true
        }
        
        
    }
    
    class MockedRepository: PokedexRepositoryProtocol {
        
        var shouldGoToErrorFlow = false
        var fetchPokemonsCalled = false
        
        func fetchPokemonList(withFilters filters: Filters, completion: @escaping RequesterCompletion<[Pokemon]>) {
            if shouldGoToErrorFlow {
                completion(nil, NetworkError.sessionError(error: "Some error"))
            } else {
                completion(TestsUtils().getMockedResponse("Pokemons"), nil)
            }
        }
        
    }
    
    var subject: PokedexListViewModel!
    var mockedCoordinator: MockedCoordinator!
    var mockedRepository: MockedRepository!
    var mockedView: MockedView!
    
    override func setUpWithError() throws {
        mockedCoordinator = MockedCoordinator()
        mockedRepository = MockedRepository()
        mockedView = MockedView()
        subject = PokedexListViewModel(withRepository: mockedRepository, andCoordinator: mockedCoordinator)
        subject.view = mockedView
        
    }
    
    override func tearDownWithError() throws {
        subject = nil
    }
    
    func testingLoadContentSuccessfully() {
        XCTAssertNotNil(subject)
        
        subject.loadContent()
        
        XCTAssertTrue(mockedView.reloadListCalled)
        XCTAssertFalse(mockedView.showErrorCalled)
        XCTAssertFalse(subject.pokemons.isEmpty)
    }
    
    func testingLoadContentFailure() {
        XCTAssertNotNil(subject)
        mockedRepository.shouldGoToErrorFlow = true
        
        subject.loadContent()
        
        XCTAssertFalse(mockedView.reloadListCalled)
        XCTAssertTrue(mockedView.showErrorCalled)
        XCTAssertTrue(subject.pokemons.isEmpty)
        
    }
    
    func testingPokemonSelection() {
        XCTAssertNotNil(subject)
        
        subject.loadContent()
        subject.pokemonSelected(atIndex: 0)
        XCTAssertNotNil(mockedCoordinator.selectedModel)
        XCTAssertNotNil(mockedCoordinator.selectedModel as! Pokemon)
        XCTAssertTrue(mockedCoordinator.presentNextStepCalled)
        XCTAssertTrue(mockedCoordinator.selectedModel is Pokemon)
        XCTAssertTrue((mockedCoordinator.selectedModel as! Pokemon).name == "bulbasaur")
        XCTAssertTrue((mockedCoordinator.selectedModel as! Pokemon).identifier == 1)
        XCTAssertTrue((mockedCoordinator.selectedModel as! Pokemon).types?.first?.type?.name == "grass")
        XCTAssertTrue((mockedCoordinator.selectedModel as! Pokemon).types?.last?.type?.name == "poison")
    }

}

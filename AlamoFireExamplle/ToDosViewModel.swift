//
//  ToDosViewModel.swift
//  AlamoFireExamplle
//
//  Created by IOS SENAC on 9/25/21.
//

import Foundation
import Combine

class ToDosViewModel: ObservableObject, Identifiable{
    let toDosHandler = TodosHandler()
    @Published var toDos: [ToDo] = []
    @Published var isLoading = false
    
    private var disposables: Set<AnyCancellable> = []
    
    private var isLoadingPublisher: AnyPublisher<Bool, Never>{
        toDosHandler.$isLoading
            .receive(on: RunLoop.main)
            .map{ $0 }
            .eraseToAnyPublisher()
    }
    
    private var todosPublisher: AnyPublisher<[ToDo], Never>{
        toDosHandler.$toDosResponse
            .receive(on: RunLoop.main)
            .map{ response in
                guard let response = response else {return []}
                return response
            }
            .eraseToAnyPublisher()
    }
    
    init() {
        isLoadingPublisher
            .receive(on: RunLoop.main)
            .assign(to: \.isLoading, on: self)
            .store(in: &disposables)
        
        todosPublisher
            .receive(on: RunLoop.main)
            .assign(to: \.toDos, on: self)
            .store(in: &disposables)
        
        toDosHandler.fetchToDos()

    }
    
    
}

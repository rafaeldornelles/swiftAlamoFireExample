//
//  File.swift
//  AlamoFireExamplle
//
//  Created by IOS SENAC on 9/25/21.
//

import Foundation
import Alamofire
import Combine

class TodosHandler : APIHandler{
    let baseurl = "https://jsonplaceholder.typicode.com"
    
    @Published var toDosResponse: [ToDo]?
    @Published var isLoading = false
    
    func fetchToDos(){
        isLoading = true
        let url = "\(baseurl)/todos"
        let request = AF.request(url)
        request.responseDecodable{ [weak self] (response: DataResponse<[ToDo], AFError>) in
            guard let weakSelf = self else { return }
            guard let response = weakSelf.handleResponse(response) as? [ToDo] else {
                weakSelf.isLoading = false
                return
            
            }
        weakSelf.isLoading = false
        weakSelf.toDosResponse = response
        }
    }
    
}

class APIHandler {
        
    var statusCode = Int.zero
    
    func handleResponse<T: Decodable>(_ response: DataResponse<T, AFError>) -> Any? {
        switch response.result {
        case .success:
            return response.value
        case .failure:
            return nil
        }
    }
}




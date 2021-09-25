//
//  ToDo.swift
//  AlamoFireExamplle
//
//  Created by IOS SENAC on 9/25/21.
//

import Foundation

class ToDo: Decodable, Identifiable{
    var userId: Int?
    var id: Int?
    var title: String?
    var completed: Bool?
    
    enum CodingKeys: String, CodingKey {
            case userId
            case id
            case title
            case completed
    }
        
    init() {}
        
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        userId = try? container.decode(Int.self, forKey: .userId)
        id = try? container.decode(Int.self, forKey: .id)
        title = try? container.decode(String.self, forKey: .title)
        completed = try? container.decode(Bool.self, forKey: .completed)
    }
    
}

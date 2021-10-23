//
//  TodoModel.swift
//  MVPSampleTodoList
//
//  Created by kosuke sakai on 2021/10/20.
//

import Foundation

protocol TodoModelInput {
    func fetchItems() -> [String]
    func addItem(itemContent: String, completion: () ->  ())
    func deleteItem(at index: Int, completion:() -> ())
}

final class TodoModel: TodoModelInput {
    
    private let userDefaults = UserDefaults.standard
    private let ITEM_KEY = "TodoItems"
    
    func fetchItems() -> [String] {
        return userDefaults.array(forKey: ITEM_KEY) as! [String]
    }
    
    func addItem(itemContent: String, completion: () ->  ()) {
        var items = userDefaults.array(forKey: ITEM_KEY) as! [String]
        items.append(itemContent)
        userDefaults.set(items, forKey: ITEM_KEY)
        completion()
    }
    
    func deleteItem(at index: Int, completion:() -> ()) {
        var items = userDefaults.array(forKey: ITEM_KEY) as! [String]
        items.remove(at: index)
        userDefaults.set(items, forKey: ITEM_KEY)
        completion()
    }
}

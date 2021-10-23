//
//  TodoListPresenter.swift
//  MVPSampleTodoList
//
//  Created by kosuke sakai on 2021/10/20.
//

import Foundation

protocol TodoListPresenterInput {
    var numberOfItems: Int{get}
    func viewDidLoad()
    func item(forRow row: Int) -> String?
    func addNewItem(itemContent: String)
    func didEditingDelete(at indexPath: IndexPath)
}

protocol TodoListPresenterOutput: AnyObject {
    func updateItems()
}

final class TodoListPresenter: TodoListPresenterInput {
    private var items: [String] = []
    
    private var model: TodoModelInput
    private weak var view: TodoListPresenterOutput!
    
    init(view: TodoListPresenterOutput, model: TodoModelInput) {
        self.model = model
        self.view = view
    }
    
    func viewDidLoad() {
        items = model.fetchItems()
        view.updateItems()
    }
    
    var numberOfItems: Int {
        return items.count
    }
    
    func item(forRow row: Int) -> String? {
        guard row < items.count else {
            return nil
        }
        return items[row]
    }
    
    func addNewItem(itemContent: String) {
        model.addItem(itemContent: itemContent) {
            items = model.fetchItems()
            view.updateItems()
        }
    }
    
    func didEditingDelete(at indexPath: IndexPath) {
        model.deleteItem(at: indexPath.row) {
            items = model.fetchItems()
            view.updateItems()
        }
    }
}

//
//  ViewController.swift
//  MVPSampleTodoList
//
//  Created by kosuke sakai on 2021/10/20.
//

import UIKit

class TodoListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var newItemTextField: UITextField!
    
    private var presenter: TodoListPresenterInput!
    
    func inject(presenter: TodoListPresenterInput) {
        self.presenter = presenter
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        presenter.viewDidLoad()
    }
    
    
    @IBAction func tappedAddButton(_ sender: Any) {
        if !newItemTextField.text!.isEmpty {
            presenter.addNewItem(itemContent: newItemTextField.text!)
            newItemTextField.text = ""
        }
    }
}

extension TodoListViewController: TodoListPresenterOutput {
    func updateItems() {
        tableView.reloadData()
    }
}

extension TodoListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfItems
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = presenter.item(forRow: indexPath.row)
        return cell
    }
}

extension TodoListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            presenter.didEditingDelete(at: indexPath)
        }
    }
}

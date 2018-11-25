//
//  ViewController.swift
//  ToDoApp
//
//  Created by Peterjohn Chisholm on 22/11/2018.
//  Copyright © 2018 pjcc. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    let defaults = UserDefaults.standard
    
    var toDoList  = [ToDoItem]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if let toDoItems = defaults.array(forKey: "ToDoList") as? [ToDoItem] {
           toDoList = toDoItems
         }
        
        let toDoItem = ToDoItem(toDoText: "Get some milk")
       
        toDoList.append(toDoItem)
        
    }

    //MARK : tableview datas source methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let currentItem = toDoList[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        cell.textLabel?.text = currentItem.toDoText
        
        // Ternary operator
        // value = condition ? value true : value false
        
        cell.accessoryType = currentItem.isChecked  ? .checkmark : .none
        cell.textLabel?.textColor = currentItem.isChecked ? UIColor.lightGray : UIColor.black
        
        
    
        return cell
    }
    
    //MARK : tableview delegate method
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print ("row selected : \(indexPath.row)")
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        
        toDoList[indexPath.row].isChecked = !toDoList[indexPath.row].isChecked
        
      tableView.reloadData()
    }
    
    @IBAction func addItemButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
       
        let alert = UIAlertController.init(title: "Add new ToDO item", message: "", preferredStyle: UIAlertController.Style.alert)
       
        
        let action = UIAlertAction(title: "Add Item", style: .default ){ (action) in
            // what will happen when the user presses the add item button.
            //self.toDoList.append(textField.text!)
            // toDoList[indexPath.row].toDoText
           // self.defaults.set(self.toDoList, forKey: "ToDoList")
            let newToDoItem = ToDoItem(toDoText: textField.text!)
            self.toDoList.append(newToDoItem)
            
            self.tableView.reloadData()
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }
        
        
        alert.addAction(action)
        
        
        present(alert, animated: true, completion: nil )
        
    }
    
    
}


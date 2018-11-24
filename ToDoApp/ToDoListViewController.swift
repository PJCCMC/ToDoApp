//
//  ViewController.swift
//  ToDoApp
//
//  Created by Peterjohn Chisholm on 22/11/2018.
//  Copyright © 2018 pjcc. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    
    var toDoList  = ["Buy eggs", "Get newspaper", "Walk the Dog"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    //MARK : tableview datas source methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
            let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        cell.textLabel?.text = toDoList[indexPath.row]
        
        return cell
    }
    
    //MARK : tableview delegate method
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print ("row selected : \(indexPath.row)")
        
       // print (tableView.cellForRow(at: indexPath)?.textLabel?.text! as Any)
        
       // print (toDoList[indexPath.row] )
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        if tableView.cellForRow(at: indexPath)?.accessoryType != .checkmark {
            tableView.cellForRow(at: indexPath)?.textLabel?.textColor = UIColor.red
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }else {
            tableView.cellForRow(at: indexPath)?.textLabel?.textColor = UIColor.black
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
            
        }
    }
    
    @IBAction func addItemButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
       
        let alert = UIAlertController.init(title: "Add new ToDO item", message: "", preferredStyle: UIAlertController.Style.alert)
       
        
        let action = UIAlertAction(title: "Add Item", style: .default ){ (action) in
            // what will happen when the user presses the add item button.
            self.toDoList.append(textField.text!)
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


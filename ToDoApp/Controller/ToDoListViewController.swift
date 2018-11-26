//
//  ViewController.swift
//  ToDoApp
//
//  Created by Peterjohn Chisholm on 22/11/2018.
//  Copyright © 2018 pjcc. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    
    let dataPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("ToDoListItems.plist")
    
    var toDoList  = [ToDoItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
      //  print (dataPath)
        
        loadData()
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
        
         updateData()
        
      
    }
    
    // MARK : add new items
    @IBAction func addItemButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
       
        let alert = UIAlertController.init(title: "Add new ToDO item", message: "", preferredStyle: UIAlertController.Style.alert)
       
        
        let action = UIAlertAction(title: "Add Item", style: .default ){ (action) in
           
            let newToDoItem = ToDoItem(toDoText: textField.text!)
            self.toDoList.append(newToDoItem)
            
            self.updateData()
           
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }
        
        
        alert.addAction(action)
        
        
        present(alert, animated: true, completion: nil )
        
    }
    
    // MARK : data manupulation for the Data Model
    func updateData (){
        
        let encoder = PropertyListEncoder()
        
        do {
            let data = try encoder.encode(toDoList)
            try data.write(to: dataPath!)
        } catch {
            print("Error in adding item to toDoListArray \(error)")
        }
        
        tableView.reloadData()
        
    }
    
    // func to load saved infomation from a plist file if it does exist.
    func loadData () {
        
        if let data =  try? Data(contentsOf: dataPath!){  // check to see if there is a file
           let decoder = PropertyListDecoder()            // create a decoder
        
            do{
                try toDoList = decoder.decode([ToDoItem].self, from: data)  // decode the plist file and load into the class array.
            }catch {
                print ("ToDOItems Plist file mot decoded \(error)")
            }
            
        }
        
    }
}


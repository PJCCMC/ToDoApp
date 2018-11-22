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
}


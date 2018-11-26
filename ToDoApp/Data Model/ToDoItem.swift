//
//  ToDoItemClass.swift
//  ToDoApp
//
//  Created by Peterjohn Chisholm on 25/11/2018.
//  Copyright © 2018 pjcc. All rights reserved.
//

import Foundation

class ToDoItem : Encodable, Decodable {
    var toDoText : String = ""
    var isChecked = false
    
    init() {}
    
    convenience init(toDoText : String) {
        self.init()
        self.toDoText = toDoText
        
    }
    
}

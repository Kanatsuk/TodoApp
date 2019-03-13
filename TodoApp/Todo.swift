//
//  Todo.swift
//  TodoApp
//
//  Created by 金築泰雅 on 2019/03/13.
//  Copyright © 2019 金築泰雅. All rights reserved.
//

import Foundation
import RealmSwift

class Todo: Object {
    @objc dynamic var id: Int = Int()
    
    @objc dynamic var title: String = String()
    
    @objc dynamic var date: String = String()


    func create(title: String)  {
       
        print(Realm.Configuration.defaultConfiguration.fileURL!)
    
        
        let realm = try! Realm()
    
        try! realm.write{
            let todo = Todo()
            let now = Date()
            
            todo.id = 1
            todo.title = title
            todo.date = "2019/03/13"
            
            realm.add(todo)
        }
    
    
    }
    
    func findAll() ->[Todo] {
        let realm = try! Realm()
        
        let todoCollection = realm.objects(Todo.self)
    
        let todos: [Todo] = todoCollection.reversed()
    
        return todos
    }


}

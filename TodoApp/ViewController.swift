//
//  ViewController.swift
//  TodoApp
//
//  Created by 金築泰雅 on 2019/03/13.
//  Copyright © 2019 金築泰雅. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    

    @IBOutlet weak var tableView: UITableView!
    
    
    
    var todos: [Todo] = []
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.dataSource = self
        tableView.delegate = self
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let todo = Todo()
       todos =  todo.findAll()
    
    tableView.reloadData()
    
    
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let todo = todos[indexPath.row]
        
        
        cell.textLabel?.text = todo.title
        
        return cell
    }

}


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
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let todo = todos[indexPath.row]
        
        
        
        performSegue(withIdentifier: "toAddVC", sender: todo)
        
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toAddVC" {
            
            let addVC = segue.destination as! AddViewController
            addVC.todo = sender as? Todo
            
            
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            
        
            let todo = Todo()
           
            let deleteTarget = todos[indexPath.row]
            todo.delete(id: deleteTarget.id)
            
            todos.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    
    
    
    
}


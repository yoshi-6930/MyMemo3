//
//  TodoTableViewController.swift
//  MyMemo3
//
//  Created by 岩元喜輝 on 2020/05/25.
//  Copyright © 2020 Yoshiki Iwamoto. All rights reserved.
//

import UIKit

class TodoTableViewController: UITableViewController {
    
    let userDefaults = UserDefaults.standard
    var todos = [String]()
    @IBAction func appendToTodoList(sender: UIStoryboardSegue){
        guard let todoSourceVC = sender.source as? TodoViewController,let todo = todoSourceVC.todo else {
            return
        }
        if let selectedPath = self.tableView.indexPathForSelectedRow{
            self.todos[selectedPath.row] = todo
        }else{
            self.todos.append(todo)
        }
        self.userDefaults.set(self.todos, forKey: "todos")
        self.tableView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        if self.userDefaults.object(forKey: "todos") != nil{
            self.todos = self.userDefaults.stringArray(forKey: "todos")!
        }

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return todos.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoTableViewCell", for: indexPath)
        cell.textLabel?.text = self.todos[indexPath.row]
        cell.detailTextLabel!.text = "created at"
        // Configure the cell...

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.todos.remove(at: indexPath.row)
             self.userDefaults.set(self.todos, forKey: "todos")
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
       
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifire = segue.identifier else {
            return
        }
        if identifire == "editTodo"{
            let todoVC = segue.destination as! TodoViewController
            todoVC.todo = self.todos[(self.tableView.indexPathForSelectedRow?.row)!]
        }
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}

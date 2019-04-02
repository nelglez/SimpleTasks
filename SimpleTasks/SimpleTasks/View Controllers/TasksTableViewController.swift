//
//  TasksTableViewController.swift
//  SimpleTasks
//
//  Created by Nelson Gonzalez on 4/2/19.
//  Copyright © 2019 Nelson Gonzalez. All rights reserved.
//

import UIKit

class TasksTableViewController: UITableViewController {
    
    let taskController = TaskController()

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.tableView.reloadData()
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return taskController.task.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath)

        let tasks = taskController.task[indexPath.row]
        
        cell.textLabel?.text = tasks.title
        
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .short
        dateFormatter.dateStyle = .short
        cell.detailTextLabel?.text = dateFormatter.string(from: tasks.date)

        return cell
    }
    

  
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            taskController.deleteTask(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    

   
    // MARK: - Navigation

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowCreateTask" {
            let destinationVC = segue.destination as? TasksDetailViewController
            destinationVC?.taskController = taskController
        } else if segue.identifier == "ShowTaskDetail" {
            let destinationVC = segue.destination as? TasksDetailViewController
            destinationVC?.taskController = taskController
            guard let indexPath = tableView.indexPathForSelectedRow else {return}
            let task = taskController.task[indexPath.row]
            destinationVC?.task = task
        }
    }
    

}

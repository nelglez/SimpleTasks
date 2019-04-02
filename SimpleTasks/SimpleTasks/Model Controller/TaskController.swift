//
//  TaskController.swift
//  SimpleTasks
//
//  Created by Nelson Gonzalez on 4/2/19.
//  Copyright © 2019 Nelson Gonzalez. All rights reserved.
//

import Foundation

class TaskController {
    
    private(set) var task: [Task] = []
    
    //MARK: - CRUD
    
    func createTask(title: String, notes: String, dueDate: Date) {
        let newTask = Task(title: title, notes: notes, date: dueDate)
        task.append(newTask)
    }
    
    func update(task: Task, title: String, notes: String, dueDate: Date) {
        
        guard let index = self.task.firstIndex(of: task) else {return}
        self.task[index].title = title
        self.task[index].notes = notes
        self.task[index].date = dueDate
    }
    
    func deleteTask(at index: Int){
        self.task.remove(at: index)
    }
    
    
    
}

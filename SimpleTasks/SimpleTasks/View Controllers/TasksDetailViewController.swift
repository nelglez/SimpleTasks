//
//  TasksDetailViewController.swift
//  SimpleTasks
//
//  Created by Nelson Gonzalez on 4/2/19.
//  Copyright © 2019 Nelson Gonzalez. All rights reserved.
//

import UIKit

class TasksDetailViewController: UIViewController {
    
    @IBOutlet weak var taskNameTextField: UITextField!
    @IBOutlet weak var notesTextView: UITextView!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    
    var taskController: TaskController?
    
    var task: Task? {
        didSet {
            updateViews()
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        updateViews()
        
    }
    

    func updateViews() {
        guard isViewLoaded else { return }
        
        guard let task = task else {return}
        
        taskNameTextField.text = task.title
        notesTextView.text = task.notes
        datePicker.date = task.date
    }
    
    @IBAction func saveBarButtonPressed(_ sender: UIBarButtonItem) {
        
        guard let title = taskNameTextField.text, !title.isEmpty, let notes = notesTextView.text, !notes.isEmpty else {
            return
        }
        if let task = task {
            //update
            taskController?.update(task: task, title: title, notes: notes, dueDate: datePicker.date)
            navigationController?.popViewController(animated: true)
        } else {
            //create
            taskController?.createTask(title: title, notes: notes, dueDate: datePicker.date)
            
            navigationController?.popViewController(animated: true)
        }
        
        
    }
    
}

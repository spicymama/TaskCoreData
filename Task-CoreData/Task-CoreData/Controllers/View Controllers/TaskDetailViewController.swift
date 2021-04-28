//
//  TaskDetailViewController.swift
//  Task-CoreData
//
//  Created by Gavin Woffinden on 4/27/21.
//

import UIKit

class TaskDetailViewController: UIViewController {

    
    @IBOutlet weak var taskNameTextField: UITextField!
    @IBOutlet weak var taskNotesTextView: UITextView!
    @IBOutlet weak var taskDueDatePicker: UIDatePicker!
    
    //MARK: - Properties
    var task: Task?
    var date: Date?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()

    }
    

    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let title = taskNameTextField.text, !title.isEmpty,
              let body = taskNotesTextView.text, !body.isEmpty else {return}
              let date = taskDueDatePicker.date
        if let task = task {
           
            TaskController.shared.updateTask(task: task, name: title, notes: body, dueDate: date)
        } else {
            TaskController.shared.createTaskWith(name: title, notes: body, dueDate: date)
        }
        navigationController?.popViewController(animated: true)
        
    }
    @IBAction func dueDatePickerChanged(_ sender: Any) {
        date = taskDueDatePicker.date
        CoreDataStack.saveContext()
    }
    
    func updateViews() {
        guard let task = task else {return}
        taskNameTextField.text = task.name
        taskNotesTextView.text = task.notes
        if let dueDate = task.dueDate {
            
        taskDueDatePicker.date = dueDate
        }
    }


}

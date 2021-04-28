//
//  TaskController.swift
//  Task-CoreData
//
//  Created by Gavin Woffinden on 4/27/21.
//

import CoreData

class TaskController {
    
    //MARK: - Properties
    static let shared = TaskController()
    var tasks: [Task] = []
    
    private lazy var fetchRequest: NSFetchRequest<Task> = {
        let request = NSFetchRequest<Task>(entityName: "Task")
        request.predicate = NSPredicate(value: true)
        return request
    }()
    
    private init() {}
    
    func createTaskWith(name: String, notes: String?, dueDate: Date?) {
        let task = Task(name: name, notes: notes)
        tasks.append(task)
        CoreDataStack.saveContext()
    }
    func updateTask(task: Task, name: String, notes: String?, dueDate: Date?) {
        task.name = name
        task.notes = notes
        task.dueDate = dueDate
        CoreDataStack.saveContext()
        
    }
    func deleteTask(task: Task) {
        guard let index = tasks.firstIndex(of: task) else {return}
        tasks.remove(at: index)
        CoreDataStack.context.delete(task)
        CoreDataStack.saveContext()
    }
    
    
    func fetchTasks() {
        tasks = (try? CoreDataStack.context.fetch(self.fetchRequest)) ?? []
        
    }
    func toggleIsComplete(task: Task) {
        task.isComplete.toggle()
        CoreDataStack.saveContext()
        
        
    }
    func updateTaskDetails(_ task: Task) {
        
        CoreDataStack.saveContext()
        
    }
    
    
    
    
    
    
}

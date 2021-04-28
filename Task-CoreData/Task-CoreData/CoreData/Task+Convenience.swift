//
//  Task+Convenience.swift
//  Task-CoreData
//
//  Created by Gavin Woffinden on 4/27/21.
//

import CoreData

extension Task {
    @discardableResult convenience init(name: String, notes: String? = nil, isComplete: Bool = false, context: NSManagedObjectContext = CoreDataStack.context) {
        self.init(context: context)
        self.name = name
        self.notes = notes
        self.isComplete = isComplete
    }
    func add(taskWithName name: String, notes: String?, dueDate: Date?) {
        
    }
    func update(task: Task, name: String, notes: String?, dueDate: Date?) {
        
    }
    func remove(task: Task) {
        
    }
    func fetchTasks() {
        
    }

}


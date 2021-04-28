//
//  TaskListTableViewController.swift
//  Task-CoreData
//
//  Created by Gavin Woffinden on 4/27/21.
//

import UIKit

class TaskListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        TaskController.shared.fetchTasks()
        tableView.reloadData()

    }
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TaskController.shared.tasks.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       guard let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell")
                as? TaskTableViewCell else {return UITableViewCell()}
        let task = TaskController.shared.tasks[indexPath.row]
        
        cell.task = task
        cell.delegate = self

        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let task = TaskController.shared.tasks[indexPath.row]
        TaskController.shared.deleteTask(task: task)
        tableView.deleteRows(at: [indexPath], with: .fade)
        CoreDataStack.saveContext()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }


   // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailVC" {
            guard let indexPath = tableView.indexPathForSelectedRow,
                  let destination = segue.destination as? TaskDetailViewController else {return}
            let task = TaskController.shared.tasks[indexPath.row]
            destination.task = task
                  
        }
    }

}
extension TaskListTableViewController: TaskCompletionDelegate {
    func taskCellButtonTapped(_ sender: TaskTableViewCell) {
        guard let task = sender.task else {return}
        TaskController.shared.toggleIsComplete(task: task)
        sender.updateViews()
        
    }
}

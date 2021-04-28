//
//  TaskTableViewCell.swift
//  Task-CoreData
//
//  Created by Gavin Woffinden on 4/27/21.
//

import UIKit

protocol TaskCompletionDelegate: AnyObject {
    func taskCellButtonTapped(_ sender: TaskTableViewCell)
}

class TaskTableViewCell: UITableViewCell {
    //MARK: - Outlets
    @IBOutlet weak var taskNameLabel: UILabel!
    @IBOutlet weak var completionButton: UIButton!
    
    //MARK: - Properties
    var task: Task? {
        didSet {
            updateViews()
        }
    }

    weak var delegate: TaskCompletionDelegate?
    private var completionButtonTapped: Bool = false
    //MARK: - Actions
    @IBAction func completionButtonTapped(_ sender: Any) {
        guard let task = task else {return}
            delegate?.taskCellButtonTapped(self)
            completionButtonTapped.toggle()
            
}
        
    //MARK: - Functions
    func updateViews() {
        guard let task = task else {return}
        taskNameLabel.text = task.name
        let checked = UIImage(named: "complete")
        let unchecked = UIImage(named: "incomplete")
        task.isComplete ? completionButton.setBackgroundImage(checked, for: .normal) :
            completionButton.setBackgroundImage(unchecked, for: .normal)
    }
}

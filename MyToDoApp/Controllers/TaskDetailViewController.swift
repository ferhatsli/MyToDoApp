//
//  TaskDetailViewController.swift
//  MyToDoApp
//
//  Created by Ferhat Taşlı on 17.11.2024.
//

import UIKit


protocol TaskDetailViewControllerDelegate: AnyObject {
    func didAddtask(_ task: Task)
}

class TaskDetailViewController: UIViewController {
    
    weak var delegate : TaskDetailViewControllerDelegate?
    
    private let titleTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Title"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    private let descriptionTextView: UITextView = {
        let textView = UITextView()
        textView.layer.borderColor = UIColor.lightGray.cgColor
        textView.layer.borderWidth = 1
        textView.layer.cornerRadius = 5
        
        return textView
    }()
    
    private let dueDatePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        return datePicker
    }()
    
    private let isComplatedSwitch: UISwitch = {
        let switchButton = UISwitch()
        return switchButton
    }()
    
    private let saveButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Kaydet", for: .normal)
        button.backgroundColor = .systemBlue
        button.tintColor = .white
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(saveTask), for: .touchUpInside)
        return button
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupSubview()
    }
    
    private func setupSubview() {
        let stackView = UIStackView(arrangedSubviews: [titleTextField, descriptionTextView, dueDatePicker, isComplatedSwitch, saveButton])
        stackView.axis = .vertical
        stackView.spacing = 16
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
            
            ])
        
        descriptionTextView.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    @objc private func saveTask() {
        guard let title = titleTextField.text, !title.isEmpty else { return }
        let description = descriptionTextView.text
        let dueDate = dueDatePicker.date
        let isCompleted = isComplatedSwitch.isOn
        let task = Task(title: title, description: description, dueDate: dueDate, isCompleted: isCompleted)
        delegate?.didAddtask(task)
        navigationController?.popViewController(animated: true)
    }
    
    
    

    

}

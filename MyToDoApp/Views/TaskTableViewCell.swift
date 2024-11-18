//
//  TaskTableViewCell.swift
//  MyToDoApp
//
//  Created by Ferhat Taşlı on 17.11.2024.
//

import UIKit

class TaskTableViewCell: UITableViewCell {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .headline)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let dueDateLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .subheadline)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .secondaryLabel
        return label
    }()
    
    private let isComplatedImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "checkmark.circle.fill")
        imageView.tintColor = .systemGreen
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(style :UITableViewCell.CellStyle, reuseIdentifier : String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(){
        contentView.addSubview(titleLabel)
        contentView.addSubview(dueDateLabel)
        contentView.addSubview(isComplatedImageView)
        
        NSLayoutConstraint.activate([
            
            isComplatedImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            isComplatedImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            isComplatedImageView.widthAnchor.constraint(equalToConstant:24 ),
            isComplatedImageView.heightAnchor.constraint(equalToConstant: 24),
            
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: isComplatedImageView.trailingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            
            dueDateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            dueDateLabel.leadingAnchor.constraint(equalTo: isComplatedImageView.trailingAnchor),
            dueDateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            dueDateLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            
            
            ])
        
           
            
    }
    
    func configure(with task: Task) {
        titleLabel.text = task.title
        dueDateLabel.text = task.dueDate != nil ? "Son Tarih \(task.dueDate!)" : "No due date"
        isComplatedImageView.isHidden = !task.isCompleted
        
    }
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

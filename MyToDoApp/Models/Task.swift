//
//  Task.swift
//  MyToDoApp
//
//  Created by Ferhat Taşlı on 17.11.2024.
//

import Foundation


struct Task : Codable{
    var title : String
    var description : String?
    var dueDate : Date?
    var isCompleted : Bool 
}

//
//  TaskStorageHelper.swift
//  MyToDoApp
//
//  Created by Ferhat Taşlı on 18.11.2024.
//

import Foundation


class TaskStorageHelper {
    private static let tasksKey = "tasks"
    
    static func saveTaks(_ tasks: [Task]) {
        do {
            let data = try JSONEncoder().encode(tasks)
            UserDefaults.standard.set(data, forKey: tasksKey)
        } catch {
            print("Error saving tasks: \(error)")
        }
    }
    
    static func loadTasks() -> [Task] {
        guard let data = UserDefaults.standard.data(forKey: tasksKey) else { return [] }
        do {
            return try JSONDecoder().decode([Task].self, from: data)
        } catch {
            print("Error loading tasks: \(error)")
            return []
        }
    }
}

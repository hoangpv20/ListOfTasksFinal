//
//  TodoListItem+CoreDataProperties.swift
//  ListOfTasksFinal
//
//  Created by admin on 01/12/2022.
//
//

import Foundation
import CoreData


extension TodoListItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TodoListItem> {
        return NSFetchRequest<TodoListItem>(entityName: "TodoListItem")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var title: String?
    @NSManaged public var desc: String?

}

extension TodoListItem : Identifiable {

}

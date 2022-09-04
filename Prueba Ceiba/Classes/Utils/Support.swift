//
//  Support.swift
//  Prueba Ceiba
//
//  Created by Horacio Solorio on 03/09/22.
//

import Foundation
import CoreData
import UIKit

// swiftlint:disable force_cast
let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
// swiftlint:enable force_cast

func saveContext() {
    if context.hasChanges {
        do {
            try context.save()
        } catch {
            print(error)
        }
    }
}

//
//  FifthStepViewModel.swift
//  ProgramaticUI
//
//  Created by Nancy Silva on 15/03/24.
//

import Foundation
import RealmSwift

class FifthStepViewModel {
    let realm = try! Realm()
    
    func save(flight: Flight) {
        do{
            try realm.write({
                realm.add(flight)
            })
        }catch{
            print("Error saving categories: \(error)")
        }
    }

}

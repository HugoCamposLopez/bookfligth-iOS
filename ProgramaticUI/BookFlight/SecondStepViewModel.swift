//
//  SecondStepViewmodel.swift
//  ProgramaticUI
//
//  Created by Nancy Silva on 15/03/24.
//

import Foundation

class SecondStepViewModel {
    
    let countries = ["SPN", "RUS", "ARG", "COL"]
    let countriesDictionary = ["SPN": "Barcelona", "RUS": "Prypiat", "ARG": "Córdoba", "COL": "Bogotá"]
    var countrySelected: String?
    var citySelected: String?
    
    func selectingDestination(at index: Int) {
        countrySelected = countries[index]
        citySelected = countriesDictionary[countrySelected!]
    }
    
}

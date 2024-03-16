//
//  FirstStepViewModel.swift
//  ProgramaticUI
//
//  Created by Nancy Silva on 15/03/24.
//

import Foundation


class FirstStepViewModel {
    
    public let countries = ["MEX", "USA", "CHN", "FRN"]
    public let countriesDictionary = ["MEX": "Ciudad de México", "USA": "California", "CHN": "China", "FRN": "París"]
    public var countrySelected: String?
    public var citySelected: String?
    
    func setValues(index: Int){
        countrySelected = countries[index]
        citySelected = countriesDictionary[countrySelected!]
    }
}

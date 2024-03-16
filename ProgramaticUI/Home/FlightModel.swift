//
//  Flight.swift
//  ProgramaticUI
//
//  Created by Nancy Silva on 08/03/24.
//

import Foundation
import RealmSwift

//
//class Flight: Object {
//    @Persisted var origin: Location?
//    @Persisted var destination: Location?
//    @Persisted var date: Date?
//    @Persisted var passengers: Int?
//}
//
//class Location: Object {
//    @Persisted var countryName: String?
//    @Persisted var cityName: String?
//}

class Flight: Object {
    @Persisted var originCountry: String?
    @Persisted var originCity: String?
    @Persisted var destinationCountry: String?
    @Persisted var destinationCity: String?
    @Persisted var date: Date?
    @Persisted var passengers: Int?

    deinit{
        print("Deallocared \(String(describing: originCountry))")
    }
//    init(originCountry: String, originCity: String, destinationCountry: String? = "", destinationCity: String? = "", date: Date? = nil, passengers: Int? = nil) {
//        self.originCountry = originCountry
//        self.originCity = originCity
//        self.destinationCountry = destinationCountry
//        self.destinationCity = destinationCity
//        self.date = date
//        self.passengers = passengers
//    }
}


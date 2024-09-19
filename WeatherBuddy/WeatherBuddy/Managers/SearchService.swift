//
//  SearchService.swift
//  WeatherBuddy
//
//  Created by Peter Berning on 9/14/24.
//

import MapKit

@Observable
class SearchService: NSObject, MKLocalSearchCompleterDelegate {
    private let completer: MKLocalSearchCompleter
    var cities: [City] = []
    
    init(completer: MKLocalSearchCompleter) {
        self.completer = completer
        super.init()
        self.completer.delegate = self
        
    }
    
    func update(queryFragment: String) {
        completer.resultTypes = [.address]
        completer.queryFragment = queryFragment
    }
    
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        cities = completer.results.compactMap { completion in
            if let mapItem = completion.value(forKey: "_mapItem") as? MKMapItem {
                return City(name: completion.title, latitude: mapItem.placemark.coordinate.latitude, longitude: mapItem.placemark.coordinate.longitude)
            } else {
                return nil
            }
        }
    }
    
}
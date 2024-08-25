//
//  LocationsViewModel.swift
//  SwiftUIMapApp
//
//  Created by Sai Teja Atluri on 6/19/24.
//

import SwiftUI
import MapKit

class LocationViewModel: ObservableObject {
    
    @Published var locations: [Location]
    
    @Published var mapLocation: Location {
        didSet {
            updateMapRegion(location: mapLocation)
        }
    }
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    @Published var showLocationsList: Bool = false
    
    // show location detail via sheet
    @Published var sheetLocation: Location? = nil
    
    init(){
        let locations       = LocationsDataService.locations
        self.locations      = locations
        self.mapLocation    = locations.first!
        self.updateMapRegion(location: locations.first!)
    }
    
    func updateMapRegion(location: Location){
        withAnimation {
            mapRegion = MKCoordinateRegion(
                center: location.coordinates, span: mapSpan)
        }
    }
    
    func toggleLocationList(){
        withAnimation(.easeInOut) {
                            showLocationsList.toggle()
                        }
    }
    
    func showNextLocation(location: Location){
        withAnimation {
            mapLocation         = location
            showLocationsList   = false
        }
    }
    
    func nextButtonPressed() {
        
        // Get the current index
        
      guard let currentIndex = locations.firstIndex(where: {$0 == mapLocation})
        else { return }
        
        // check if the next index is valid
        
        let nextIndex = currentIndex + 1
        guard locations.indices.contains(nextIndex) else {
            guard let firstLocation = locations.first else {return}
            showNextLocation(location: firstLocation)
            return
        }
        
        let nextLocation = locations[nextIndex]
        showNextLocation(location: nextLocation)
    }
    
    
}
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
//    //All loaded locations
//    
//    @Published var locations: [Location]
//    
//    @Published var mapLocation: Location {
//        didSet {
//            updateMapRegion(location: mapLocation)
//        }
//    }
//    
//    
//    // current region on the map
//    
//    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
//    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
//    
//    // show list of locations
//    @Published var showLocationsList: Bool = false
//    
//    init(){
//        let locations = LocationsDataService.locations
//        self.locations = locations
//        self.mapLocation = locations.first!
//        self.updateMapRegion(location: locations.first!)
//    }
//    
//    private func updateMapRegion(location: Location) {
//        withAnimation(.easeInOut) {
//            mapRegion = MKCoordinateRegion(
//                center: location.coordinates,
//                span: mapSpan)
//        }
//    }
//    
//    func toggleLocationList() {
//        
//        withAnimation(.easeInOut) {
//                    showLocationsList.toggle()
//                }
//    }
//}

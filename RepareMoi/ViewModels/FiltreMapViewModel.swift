//
//  FiltreUtilisateurViewModel.swift
//  RepareMoi
//
//  Created by Apprenant 39 on 08/12/2021.
//

import Foundation
import CoreLocation

struct FiltreMapViewModel {
    var selectedAppareilType : AppareilCategory = .ordinateur
    var isReparateur: Bool = false
    var userHasPieces: Bool = false
    var wantedLocalization: String = ""
}

struct GeoFinder {
    static let countries : [String] = GeoFinder.loadCountries(from: "countries")!
    
    static private var geocoder = CLGeocoder()
    
    static var longitude: Double = 0.0
    static var latitude: Double = 0.0
    
    static var errorMsg = ""
    
    private init() {
        
    }
    
    static private func loadCountries<T: Decodable>(from path: String) -> T? {
        do {
            if let bundlePath = Bundle.main.path(forResource: path, ofType: "json"),
               let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                let decodedData = try JSONDecoder().decode(T.self,
                                                           from: jsonData)
                return decodedData
            }
        } catch {
            print("Error reading resource \(path)")
        }
        
        return nil
    }
    
    
    
    static func getLocationCoordinate(for wantedLocalization: String, completion: ((Double?, Double?, String?) -> Void)! ) -> CLLocationCoordinate2D? {
        if wantedLocalization != "" {
            
            GeoFinder.geocoder.geocodeAddressString(wantedLocalization) { (placemark, error) in
                GeoFinder.processResponse(withPlacemarks: placemark, error: error) { (longitude_, latitude_) in
                    guard GeoFinder.errorMsg == "" else {
                        completion(0.0, 0.0, GeoFinder.errorMsg)
                        print("Error : ", GeoFinder.errorMsg)
                        return
                    }
                    GeoFinder.latitude = latitude_!
                    GeoFinder.longitude = longitude_!
                    
                    completion(latitude_, longitude_, GeoFinder.errorMsg)
                }
            }
        }
        
        return nil
    }
    
    static func processResponse(withPlacemarks placemarks: [CLPlacemark]?, error: Error?, completion: ((Double?, Double?) -> Void)! ) {
        if let error_ = error {
            print("Unable to Forward Geocode Address (\(error_)")
            self.errorMsg = "Unable to Find Location for Address"
            completion(0.00,0.00)
        }
        else {
            var location : CLLocation?
            if let placemarks = placemarks, placemarks.count > 0 {
                location = placemarks.first?.location
            }
            
            if let location = location {
                let coordinate = location.coordinate
                self.latitude = coordinate.latitude
                self.longitude = coordinate.longitude
                self.errorMsg = ""
                completion(latitude,longitude)
            }
            else {
                self.errorMsg = "No Matching Location Found"
                completion(0.0,0.0)
            }
        }
    }
}

struct FiltreData {
    var isReparateur: Bool
    var appareilType: AppareilCategory
    var localization: CLLocationCoordinate2D?
}
    
    

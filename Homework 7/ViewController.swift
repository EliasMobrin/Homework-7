//
//  ViewController.swift
//  Homework 7
//
//  Created by Elias Mobrin on 4/28/20.
//  Copyright © 2020 Elias Mobrin. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    
    
    @IBOutlet weak var distanceLabel: UILabel!
    
    let locMan: CLLocationManager = CLLocationManager()
    var startLocation: CLLocation!
    
    // My home location
    let kmbLatitude: CLLocationDegrees = 53.430944
    let kmbLongitude: CLLocationDegrees = -2.960809
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let newLocation: CLLocation=locations[0]
        NSLog("Something is happening")
        
        
        // horizontal accuracy less than than 0 means failure at gps level
        if newLocation.horizontalAccuracy >= 0 {
            
            
            let mb:CLLocation = CLLocation(latitude: kmbLatitude, longitude: kmbLongitude)
            
            let delta:CLLocationDistance = mb.distance(from: newLocation)
            
            let miles: Double = (delta * 0.000621371) + 0.5  //meters rounded to miles
            
            if miles < 3 {
                // Stop updating the location
                locMan.stopUpdatingLocation()
                // Congratulate the user
                distanceLabel.text = "Enjoy\nAnfield"
            } else {
                let commaDelimited: NumberFormatter = NumberFormatter()
                commaDelimited.numberStyle = NumberFormatter.Style.decimal
                
                distanceLabel.text=commaDelimited.string(from: NSNumber(value: miles))!+" miles to Anfield"
            }
            
        }
        else
        {
            //add action if error with GPS
        }
    }
    


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        locMan.delegate = self
        locMan.desiredAccuracy = kCLLocationAccuracyThreeKilometers
        locMan.distanceFilter = 1609; // a mile (in meters)
        locMan.requestWhenInUseAuthorization() // verify access to gps
        locMan.startUpdatingLocation()
        startLocation = nil

    }


}


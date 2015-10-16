//
//  PantsViewController.swift
//  Pants-o-mattic
//
//  Created by Artpi on 15.10.2015.
//  Copyright © 2015 Automattic. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit


class PantsViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet var pantsAnswer:UILabel!
    
    let locationManager = CLLocationManager()
    
//    let pantsLatitude = 40.684961
//    let pantsLongitude = -111.5570532
    let coordinate = CLLocationCoordinate2D(latitude: 37.7873589, longitude: -122.408227)

    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.locationManager.requestAlwaysAuthorization()
        
        // For use in foreground
        self.locationManager.requestWhenInUseAuthorization()
        
        //pantsAnswer.hidden = true
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
            
            
            let region = CLCircularRegion(center: coordinate, radius: 100.0, identifier: "home")
            region.notifyOnEntry = true
            region.notifyOnExit = true
            locationManager.startMonitoringForRegion(region)
        }
        
    }

    
    func locationManager(manager: CLLocationManager, didEnterRegion region: CLRegion!) {
        pantsAnswer.text = "No pants. Woohoo!"
    }
    
    func locationManager(manager: CLLocationManager!, didExitRegion region: CLRegion!) {
        pantsAnswer.text = "Put on your pants!"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
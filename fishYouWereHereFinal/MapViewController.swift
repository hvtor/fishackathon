//
//  MapViewController
//  fishYouWereHereFinal
//
//  Created by Gavin Thompson on 2015-06-05.
//  Copyright (c) 2015 Gavin Thompson. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    
    @IBOutlet var mapView:MKMapView!
    
    var locations = []
    var currentUsers = []
    let locationManager = CLLocationManager()
    var userLocationUpdated:Bool!
    
//    let userLocationLabel:UILabel!
//    let userCenterButton:UIButton!
//    - (void) centerOnUser:(id)sender;
//    - (void)showRestaurantsAndCenter:(BOOL)shouldCenter;
//    
//    - (void)displayTable:(id)sender;

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.setupMap()
        self.setupLocationManager()
        
        
        let location = self.locationManager.location
//        let coordinate = location.coordinate
        
        let coordinate:CLLocationCoordinate2D = CLLocationCoordinate2DMake( 21.438912, -158.000057) // Oahu!!
        
        
        
        let regionWidth:CLLocationDistance = 5000; //double CLLocationDistance
        let regionHeight:CLLocationDistance = 5000; //double CLLocationDistance
        
        let startRegion:MKCoordinateRegion = MKCoordinateRegionMakeWithDistance(coordinate, regionWidth, regionHeight)
        
        self.mapView.setRegion( startRegion, animated:true )
        self.mapView.showsUserLocation = true;
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupMap(){

        self.mapView.delegate = self;
        self.mapView.scrollEnabled = true;
        self.mapView.zoomEnabled = true;
        //    more options
        self.mapView.showsPointsOfInterest = true;
        self.mapView.showsUserLocation = true;
        self.mapView.showsBuildings = true;
        
//        self.view.addSubview( self.mapView );

    }
    
    func setupLocationManager(){
        self.locationManager.delegate = self;
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.startUpdatingLocation()
        self.locationManager.requestAlwaysAuthorization()
        self.locationManager.startUpdatingLocation()
    }
    
    
}


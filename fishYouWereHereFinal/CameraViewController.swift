//
//  CameraViewController
//  fishYouWereHereFinal
//
//  Created by Gavin Thompson on 2015-06-05.
//  Copyright (c) 2015 Gavin Thompson. All rights reserved.
//

import UIKit
import CoreLocation

class CameraViewController: UIViewController, UITabBarControllerDelegate,UINavigationControllerDelegate, UIImagePickerControllerDelegate, CLLocationManagerDelegate {
    
    var coreLocationManager:CLLocationManager!
    var imagePicker: UIImagePickerController!
    
    let request = HTTPCommunication()
//    var 
    

    var pictureLocationCoords:CLLocationCoordinate2D!
    var pictureLocationLat:Double!
    var pictureLocationLng:Double!
//    var pictureCurrentWeather
    
    @IBOutlet var imageView: UIImageView!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        println("camera vc loaded")
        setupLocationManager()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func takePhoto(sender: UIButton) {
        println("button clicked")
        imagePicker =  UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .Camera
        
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
        imageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        
        getLocation()
        
    }
    
    func getLocation(){
        
        pictureLocationCoords = coreLocationManager.location.coordinate
        pictureLocationLat = coreLocationManager.location.coordinate.latitude
        pictureLocationLng = coreLocationManager.location.coordinate.longitude
        
        self.request.getWeatherData( pictureLocationLat, lng: pictureLocationLng) // sets up current temp within initialized request variable to be passed forward
        
       
    }
    
    func locationManager(manager:CLLocationManager, didUpdateLocations locations:[AnyObject]) {
        //        println("locations = \(locations)")
    }
    
    func setupLocationManager(){
        coreLocationManager = CLLocationManager()
        coreLocationManager.delegate = self
        coreLocationManager.desiredAccuracy = kCLLocationAccuracyBest
        coreLocationManager.startUpdatingLocation()
        coreLocationManager.requestAlwaysAuthorization()
        coreLocationManager.startUpdatingLocation()
    }
    
}


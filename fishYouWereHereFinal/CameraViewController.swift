//
//  CameraViewController
//  fishYouWereHereFinal
//
//  Created by Gavin Thompson on 2015-06-05.
//  Copyright (c) 2015 Gavin Thompson. All rights reserved.
//

import UIKit
import CoreLocation
import MobileCoreServices


class CameraViewController: UIImagePickerController, UITabBarControllerDelegate,UINavigationControllerDelegate, UIImagePickerControllerDelegate, CLLocationManagerDelegate {
    
    var coreLocationManager:CLLocationManager!
    var imagePicker: UIImagePickerController!
    let request = HTTPCommunication()
    

    var pictureLocationCoords:CLLocationCoordinate2D!
    var pictureLocationLat:Double!
    var pictureLocationLng:Double!
    
    var capturedImage:UIImage!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        println("camera vc loaded")
        setupLocationManager()
        
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.mediaTypes = [kUTTypeImage]

        imagePicker.sourceType = UIImagePickerControllerSourceType.Camera
        presentViewController(imagePicker, animated: true, completion: nil)

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        self.capturedImage = info[UIImagePickerControllerOriginalImage] as? UIImage
        var imageData:NSData = UIImageJPEGRepresentation(capturedImage, 0.5)

        getLocation()

        imagePicker.dismissViewControllerAnimated(true, completion: nil)
        
        performSegueWithIdentifier("cameraToForm", sender:self )
        
        
        println("TEST \(info[UIImagePickerControllerOriginalImage] as! UIImage)")
        
        
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
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "cameraToForm") {
            
            var formVC = (segue.destinationViewController as! FormViewController)
            formVC.weatherRequest = self.request
            formVC.pictureLocationCoords = self.pictureLocationCoords
            formVC.pictureLocationLat = self.pictureLocationLat
            formVC.pictureLocationLng = self.pictureLocationLng
            formVC.capturedImage = self.capturedImage
        
        }
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


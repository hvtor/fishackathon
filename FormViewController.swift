//
//  FormViewController.swift
//  fishYouWereHereFinal
//
//  Created by Hemant V. Torsekar on 2015-06-07.
//  Copyright (c) 2015 Gavin Thompson. All rights reserved.
//

import UIKit

class FormViewController: UIViewController {

    var sliderSelectedValue:Int!
    @IBOutlet var estimateSlider: UISlider!
    @IBOutlet var estimateValueLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    
    var weatherRequest:HTTPCommunication!
    var pictureLocationCoords:CLLocationCoordinate2D!
    var pictureLocationLat:Double!
    var pictureLocationLng:Double!
    var capturedImage:UIImage!

    
    override func viewDidLoad() {
        super.viewDidLoad()

//        println(weatherRequest)
//        println(pictureLocationCoords)
//        println(pictureLocationLat)
//        println(pictureLocationLng)
//        println(capturedImage)
        
        
        
        imageView.image = capturedImage!
        // Do any additional setup after loading the view.
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
    
    func configureDefaultSlider() {
        estimateSlider.minimumValue = 1
        
        estimateSlider.maximumValue = 1000
        
        estimateSlider.continuous = false
        estimateSlider.minimumValueImage = UIImage(named: "fish.png")
        estimateSlider.minimumValueImage = UIImage(named: "fish2.png")
        estimateSlider.addTarget(self, action: "sliderValueDidChange:", forControlEvents: .ValueChanged)
    }
    
    @IBAction func sliderValueChanged(sender: UISlider) {
        
        sliderSelectedValue = Int(sender.value*1000);
        
        
        estimateValueLabel.text = "\(sliderSelectedValue)"

    }
    
    @IBAction func submitReport(sender: AnyObject) {
            sendToParse()
    }
    
    func sendToParse(){
        var report = PFObject( className: "FishReport" )
        report.setObject( self.pictureLocationLat, forKey: "lat")
        report.setObject( self.pictureLocationLng, forKey: "lng")
        report.setObject( self.sliderSelectedValue, forKey: "schoolSize")
        report.setObject( self.weatherRequest.currentTemp, forKey: "currentTemp")
        report.setObject( self.weatherRequest.currentConditions, forKey: "currentConditions")
        report.setObject( self.weatherRequest.currentWindDegrees, forKey: "windDegrees")
        report.setObject( self.weatherRequest.currentWindSpeed, forKey: "windSpeed")
        
        var imageData:NSData = UIImagePNGRepresentation( capturedImage );
        report.setObject( PFFile(data: imageData), forKey: "image")

        report.saveInBackgroundWithBlock{
            (success:Bool, error:NSError?) -> Void in
            if success {
                println("Object created with id: \(report.objectId)")
            } else {
                println("rerror: \(error)")
//                self.reactivateTextView()
//                self.replaceSpinnerWithSubmitButton()
            }
        }
    }

    
    

}

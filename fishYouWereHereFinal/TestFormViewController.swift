

import UIKit

class TestFormViewController: UIViewController{
    
    var weatherRequest:HTTPCommunication!
    var pictureLocationCoords:CLLocationCoordinate2D!
    var pictureLocationLat:Double!
    var pictureLocationLng:Double!
    var capturedImage:UIImage!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        println(weatherRequest)
        println(pictureLocationCoords)
        println(pictureLocationLat)
        println(pictureLocationLng)
        println(capturedImage) 
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

